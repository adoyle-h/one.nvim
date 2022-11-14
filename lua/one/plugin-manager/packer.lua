local util = require('one.util')

local P = {}

local function parseOpts(repo, opts)
	local plugOpts = { repo }

	-- Some fields is ignored. Because PluginManager has implemented these functions.
	local fields = {
		-- LuaFormatter off
		'after', 'as', 'branch', 'bufread', 'cmd', 'commit', 'cond', --[[ 'config', ]] 'disable',
		'event', 'fn', 'ft', 'installer', 'keys', 'lock', 'module', 'module_pattern', 'opt',
		--[[ 'requires', ]] 'rocks', 'rtp', 'run', --[[ 'setup', ]] 'tag', 'updater',
		-- LuaFormatter on
	}

	for _, v in pairs(fields) do plugOpts[v] = opts[v] end

	local after = {}
	for _, depPkg in pairs(opts.requires or {}) do
		if depPkg.repo then after[#after + 1] = util.getRepoName(depPkg.repo) end
	end
	for _, depPkg in pairs(opts.deps or {}) do
		if depPkg.repo then after[#after + 1] = util.getRepoName(depPkg.repo) end
	end
	if not vim.tbl_isempty(after) then plugOpts.after = after end

	return plugOpts
end

local function checkPackageRoot(packerConfig)
	local pkgRoot = packerConfig.package_root

	if not vim.endswith(pkgRoot, '/pack') then
		error(string.format(
			'The value must endswith "/pack". Current is "%s". Check the value of config.pluginManager.packer.config.package_root.',
			pkgRoot))
	end

	if not vim.tbl_contains(vim.opt.packpath:get(), pkgRoot) then
		local packpath = vim.fs.dirname(packerConfig.package_root)

		-- for packadd plugins, add user defined packpath to packpath list
		vim.opt.packpath:prepend{ packpath }

		-- packer.nvim will add "/pack/*/start/*" to rtp
	end
end

-- @param params see lua/one/plugin-manager/init.lua
function P.setup(params)
	local config = params.config
	local packerOpts = config.pluginManager.packer
	local packerConfig = packerOpts.config

	checkPackageRoot(packerConfig)

	local isNew = util.ensurePkg { -- ensure packer.nvim downloaded
		url = packerOpts.packerSrc,
		dist = packerOpts.packerFolder,
	}
	if isNew then util.packadd(packerOpts.packerFolder) end

	packerConfig.git.default_url_format = util.proxyGithub(packerConfig.git.default_url_format)

	local packer = require('packer')

	P.loadPlug = function(repo, opts)
		local plugOpts = parseOpts(repo, opts)
		packer.use(plugOpts)
	end

	P.packerConfig = packerConfig

	vim.keymap.set('n', '<SPACE>P', ':PackerStatus<CR>', { desc = 'Show Plugin Status' })

	-- https://github.com/wbthomason/packer.nvim#the-startup-function
	packer.startup {
		function()
			-- packer.use 'wbthomason/packer.nvim' -- must add itself
			-- if config.impatient.enable then packer.use 'lewis6991/impatient.nvim' end
			params.loadPlugs()
		end,

		config = packerOpts.config,
		rocks = packerOpts.rocks,
	}

	if isNew or (not util.existFile(packerConfig.compile_path)) then
		vim.api.nvim_create_autocmd('User', {
			pattern = 'PackerComplete',
			callback = function()
				-- The packer compiled file is already loaded by PackerSync
				params.run(isNew)
			end,
		})

		packer.sync()
	else
		-- It's very important to load packer compiled file
		-- https://github.com/wbthomason/packer.nvim/discussions/196#discussioncomment-339231
		vim.cmd.luafile(packerConfig.compile_path)

		params.run(isNew)
	end

	return isNew
end

function P.getPluginFolderPath(folderName)
	local root = P.packerConfig.package_root
	local plugin_package = P.packerConfig.plugin_package

	-- ~/.local/share/nvim/site/pack/packer/opt is for lazy loaded plugins
	-- ~/.local/share/nvim/site/pack/packer/start is for non-lazy loaded plugins
	-- https://github.com/wbthomason/packer.nvim/discussions/887
	local folderPath = util.pathJoin(root, plugin_package, 'start', folderName)

	if util.existDir(folderPath) then
		return folderPath
	else
		return util.pathJoin(root, plugin_package, 'opt', folderName)
	end
end

P.cmds = { install = 'PackerSync', status = 'PackerStatus' }

return P
