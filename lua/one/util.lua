local consts = require('one.consts')

local util = {}

local api = vim.api
local fn = vim.fn
local tbl_islist = vim.tbl_islist

local PATH_SEPARATOR = consts.PATH_SEPARATOR
local IS_WINDOWS = consts.IS_WINDOWS

-- @usage notify('message')
-- @usage notify('message', 'error')
-- @usage notify('message', {level = 'error'})
-- @usage notify('message', {level = 'error', defer = true})  use vim.schedule to notify message
--
-- Default level is "info"
local function notify(msg, opts)
	if not opts then
		vim.notify(msg, 'info')
	elseif opts.defer then
		vim.schedule(function()
			vim.notify(msg, opts.level or 'info')
		end)
	else
		vim.notify(msg, opts.level or opts or 'info')
	end
end
util.notify = notify

-- Joins arbitrary number of paths together.
-- Modified from https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/utils.lua#L704
-- @param ... string The paths to join.
-- @return string
function util.pathJoin(...)
	local args = { ... }
	if #args == 0 then return '' end

	local all_parts = {}

	for _, arg in ipairs(args) do
		if arg == '' and #all_parts == 0 and not IS_WINDOWS then
			all_parts = { '' }
		else
			local arg_parts = vim.split(arg, '/')
			vim.list_extend(all_parts, arg_parts)
		end
	end

	return table.concat(all_parts, PATH_SEPARATOR)
end

local HOME_DIR = util.pathJoin(consts.HOME_DIR)
local CACHE_DIR = util.pathJoin(consts.CACHE_DIR)
local DATA_DIR = util.pathJoin(consts.DATA_DIR)
local CONFIG_DIR = util.pathJoin(consts.CONFIG_DIR)

function util.path(path)
	return HOME_DIR .. PATH_SEPARATOR .. util.pathJoin(path)
end

function util.dataPath(path)
	return DATA_DIR .. PATH_SEPARATOR .. util.pathJoin(path)
end

function util.cachePath(path)
	return CACHE_DIR .. PATH_SEPARATOR .. util.pathJoin(path)
end

function util.configPath(path)
	return CONFIG_DIR .. PATH_SEPARATOR .. util.pathJoin(path)
end

function util.existDir(path)
	return fn.isdirectory(path) == 1
end
util.isDir = util.existDir

-- directory is a file
function util.existFile(path)
	return fn.empty(fn.glob(path)) == 0
end
util.isFile = util.existFile

function util.getFolderName(repo)
	local s = vim.fn.split(repo, '/')
	local name = s[#s]
	if vim.endswith(name, '.git') then name = name:sub(0, -5) end
	return name
end

-- @return {boolean} whether is new file
function util.ensurePkg(params)
	local url = util.proxyGithub(params.url)
	local dist = params.dist

	if not util.existDir(dist) then
		local cmd = string.format('git clone --depth 1 --single-branch "%s" "%s" 2>&1 >/dev/null', url,
			dist)
		notify(string.format('Not found %s\nTo run: %s', dist, cmd))

		local str = fn.system(cmd)
		if vim.v.shell_error > 0 then
			error(string.format('util.ensurePkg failed. exit code=%s. Reason: %s', vim.v.shell_error, str))
		end

		return true
	end

	return false
end

-- @return {boolean} whether is new file
function util.ensureFile(params)
	local url = util.proxyGithub(params.url)
	local dist = params.dist

	if not util.existFile(dist) then
		local cmd = string.format('curl --create-dirs -sSLo "%s" "%s" 2>&1 >/dev/null', dist, url)
		notify(string.format('Not found %s\nTo run: %s', dist, cmd))

		local str = fn.system(cmd)
		if vim.v.shell_error > 0 then
			error(string.format('util.ensureFile failed. exit code=%s. Reason: %s', vim.v.shell_error, str))
		end

		return true
	end

	return false
end

function util.proxyGithub(url)
	return url
end

---Merge two tables recursively. The later override the previous
function util.merge(v1, v2)
	local v1IsArray = tbl_islist(v1)
	local v2IsArray = tbl_islist(v2)

	if v1IsArray and v2IsArray then return v2 end

	local v1IsTable = type(v1) == 'table'
	local v2IsTable = type(v2) == 'table'

	if v1IsTable and v2IsTable then
		local tbl = {}

		for k, v in pairs(v1) do tbl[k] = v end

		for k, v in pairs(v2) do tbl[k] = util.merge(v1[k], v) end

		return tbl
	end

	if v2 == nil then
		return v1
	else
		return v2
	end
end

function util.getVisualSelection(return_raw)
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	if return_raw then
		return text
	else
		return string.gsub(text, '\n', '')
	end
end

local buffers = {}

function util.newWindow(opts)
	opts = opts or {}
	local title = opts.title

	vim.cmd.vsplit()
	local win = api.nvim_get_current_win()
	local buf = api.nvim_create_buf(true, true)

	if title then
		local ok = pcall(api.nvim_buf_set_name, buf, title)
		if not ok then api.nvim_buf_delete(buffers[title], { force = true }) end
		pcall(api.nvim_buf_set_name, buf, title)
		buffers[title] = buf
	end

	api.nvim_buf_set_option(buf, 'filetype', opts.ft or 'text')
	api.nvim_buf_set_option(buf, 'sw', opts.sw or 2)
	api.nvim_buf_set_option(buf, 'ts', opts.ts or 2)

	api.nvim_win_set_option(win, 'foldmethod', 'indent')
	api.nvim_win_set_option(win, 'foldlevel', opts.foldlevel or 1)
	api.nvim_win_set_option(win, 'cc', '')

	api.nvim_win_set_buf(win, buf)
	vim.cmd 'vertical resize 80'

	api.nvim_win_set_option(win, 'nu', true)
	api.nvim_win_set_option(win, 'rnu', true)
	api.nvim_win_set_option(win, 'cursorline', true)

	local row = 0
	local write = function(content)
		if type(content) == 'string' then content = { content } end
		api.nvim_buf_set_lines(buf, row, row, true, content)
		row = row + #content
	end

	local writeVal = function(content)
		local text = vim.split(vim.inspect(content), '\n')
		api.nvim_buf_set_lines(buf, row, row, true, text)
		row = row + #text
	end

	return {
		write = write,
		writeVal = writeVal,
		win = win,
		resetCursor = function()
			api.nvim_win_set_cursor(win, { 1, 0 })
		end,
	}
end

function util.bind(func, ...)
	local rest = { ... }
	return function(...)
		local args = {}

		for i = 1, #rest do args[i] = rest[i] end

		for i = 1, select('#', ...) do table.insert(args, select(i, ...)) end

		return func(table.unpack(args))
	end
end

function util.bindAfter(func, ...)
	local rest = { ... }
	return function(...)
		local args = {}

		for i = 1, select('#', ...) do table.insert(args, select(i, ...)) end

		for i = 1, #rest do args[i] = rest[i] end

		return func(table.unpack(args))
	end
end

function util.tbl_concat(t1, t2)
	for i = 1, #t2 do t1[#t1 + 1] = t2[i] end
	return t1
end

function util.input(func, prompt)
	vim.ui.input({ prompt = prompt or 'Enter value: ' }, func)
end

function util.select(func, list, format, prompt)
	vim.ui.select(list, { prompt = prompt or 'Select Item', format_item = format }, function(item, idx)
		if idx then func(item, idx) end
	end)
end

function util.isFile(path)
	local f = io.open(path, 'r')
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

local function gotoDefinition(target)
	if vim.fn.expand('%:p') ~= target.filename then vim.cmd.edit(target.filename) end
	vim.api.nvim_win_set_cursor(0, { target.lnum, target.col - 1 })
end

function util.gotoDef()
	vim.lsp.buf.definition {
		reuse_win = true,
		on_list = function(options)
			-- title, context.method context.
			local items = options.items

			if #items > 1 then
				local pwd = vim.fn.getcwd()

				vim.ui.select(items, {
					prompt = options.title,
					format_item = function(item)
						return string.format('%s [%s,%s] | %s', item.filename:gsub(pwd, '.'), item.lnum, item.col,
							vim.trim(item.text))
					end,
				}, function(_, idx)
					if idx then gotoDefinition(items[idx]) end
				end)
			else
				gotoDefinition(items[1])
			end
		end,
	}
end

function util.clearKeymaps(prefix, buffer)
	local keys = vim.fn.getcompletion(prefix, 'mapping')
	for _, key in pairs(keys) do vim.keymap.del('n', key, { buffer = buffer or 0 }) end
end

-- see :h packadd
function util.packadd(dist)
	local name = util.getFolderName(dist)
	vim.cmd.packadd(name)
end

function util.floatWindow()
	-- local last_win = vim.api.nvim_get_current_win()
	-- local last_pos = vim.api.nvim_win_get_cursor(last_win)
	local columns = vim.o.columns
	local lines = vim.o.lines
	local width = math.ceil(columns * 0.8)
	local height = math.ceil(lines * 0.8 - 4)
	local left = math.ceil((columns - width) * 0.5)
	local top = math.ceil((lines - height) * 0.5)

	local opts = {
		relative = 'editor',
		style = 'minimal',
		width = width,
		height = height,
		col = left,
		row = top,
		border = {
			{ '╭', 'FloatBorder' },
			{ '─', 'FloatBorder' },
			{ '╮', 'FloatBorder' },
			{ '│', 'FloatBorder' },
			{ '╯', 'FloatBorder' },
			{ '─', 'FloatBorder' },
			{ '╰', 'FloatBorder' },
			{ '│', 'FloatBorder' },
		},
	}

	local buf = vim.api.nvim_create_buf(false, true)
	local win = vim.api.nvim_open_win(buf, true, opts)

	vim.api.nvim_win_set_option(win, 'winhighlight', 'NormalFloat:Normal')

	return win, buf
end

-- @param str {string} Github/Gitlab repo name
-- @return {string}
function util.getRepoName(str)
	local list = vim.split(str, '/')
	local name = list[#list]
	list = vim.split(name, '.git')
	return list[1]
end

local getDigraph = vim.fn.digraph_get
function util.superNum(number)
	if number <= 9 then
		return getDigraph(number .. 'S')
	else
		return util.superNum(math.floor(number / 10)) .. getDigraph((number % 10) .. 'S')
	end
end

function util.subNum(number)
	if number <= 9 then
		return getDigraph(number .. 's')
	else
		return util.subNum(math.floor(number / 10)) .. getDigraph((number % 10) .. 's')
	end
end

function util.rm(path)
	if string.find(path, '/') ~= 1 then
		error(string.format('The path must be an absolute path. Current: "%s"', path))
	end

	local forbidden_chars = { '../', './', '*', '"', '\'', ' ' }
	for _, char in pairs(forbidden_chars) do
		if string.find(path, char:gsub('%.', '%%.')) ~= nil then
			error(string.format('The path must not contain "%s". Current: "%s"', char, path))
		end
	end

	local protected_paths = {
		-- LuaFormatter off
		-- Linux
		'/', '/bin', '/boot', '/dev', '/etc', '/home', '/initrd', '/lib', '/lib32', '/lib64', '/proc',
		'/root', '/sbin', '/sys', '/usr', '/usr/bin', '/usr/include', '/usr/lib', '/usr/local',
		'/usr/local/bin', '/usr/local/include', '/usr/local/sbin', '/usr/local/share', '/usr/sbin',
		'/usr/share', '/usr/src', '/var',
		-- MacOS
		'/Applications', '/cores', '/Library', '/System', '/System/Applications', '/System/Developer',
		'/System/DriverKit', '/System/iOSSupport', '/System/Library', '/System/Volumes', '/Users',
		'/Users/Shared', '/Volumes', '/private',
		-- LuaFormatter on
	}
	if vim.tbl_contains(protected_paths, path) then
		error(string.format('The path is protected that cannot be deleted. Current: "%s"', path))
	end

	local cmd = string.format('rm -rf "%s"', path)
	local exitCode = os.execute(cmd)
	if exitCode > 0 then
		return error(string.format('Failed to execute command "%s". exit code=%s', cmd, exitCode))
	end
end

return util
