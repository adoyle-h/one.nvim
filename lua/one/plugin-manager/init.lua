local util = require('one.util')
local CM = require('one.config')
local N = require('one.plugin-manager.normalize')
local Plug = require('one.plugin-manager.plug')
local usePlug = require('one.plugin-manager.use-plug')

local notify = util.notify

local PM = { --
	plugs = {},
	plugMap = {},
	userPlugins = {},
	configFn = nil,
	P = nil,
	index = 0,
}

N.PM = PM
local normalizeOpts = N.normalizeOpts
local executePlugOptions = Plug.executePlugOptions

-- Load Plug
-- @useage Plug(repo[, opts])
-- @useage Plug({repo, opts...})
--
-- @param repo {string}
--   repo='<github-user>/<repo-name>' such as , or
--   repo='name' without '/'
-- @param [opts] {PlugOpts}
-- @example See examples at ./lua/one/plugins.lua
function PM.Plug(repo, opts)
	local ok, reason = xpcall(usePlug, debug.traceback, PM, PM.P.loadPlug, repo, opts)

	if not ok then
		if type(repo) == 'string' then
			notify(string.format('Failed to load plug "%s". Reason: %s', repo, reason), 'error')
		else
			notify(string.format('Failed to load plug "%s". Reason: %s', opts[1], reason), 'error')
		end
	end
end

-- @param path {string} Load builtin plugin
function PM.LoadBuiltinPlug(path)
	local opts = require('one.plugins.' .. path)
	PM.Plug(opts)
end

function PM.isPlugDisabled(id)
	local p = PM.plugMap[id]
	if p then
		return p.disable
	else
		return true
	end
end

local function getPlugFolderName(repo)
	local s = vim.fn.split(repo, '/')
	local name = s[#s]
	if vim.endswith(name, '.git') then name = name:sub(0, -5) end
	return name
end

local function isPlugDownloaded(repo)
	local folderPath = PM.P.getPluginFolderPath(getPlugFolderName(repo))

	return util.existDir(folderPath)
end

local function disablePlug(plug, reason)
	plug.disable = true
	plug.reason = plug.reason or reason

	local reason2 = string.format('Its parent plugin "%s" is disabled', plug.id)
	for _, depPlug in pairs(plug.requires or {}) do disablePlug(depPlug, reason2) end
	for _, depPlug in pairs(plug.deps or {}) do disablePlug(depPlug, reason2) end
end

-- @param isNew {boolean}  Passed by P. It means whether the plugin-manager repo installed just now.
function PM.run(isNew)
	local config = CM.config
	local pendings = {}

	-- After plugin-manager do cmds.install. Check downloaded folder for each plugin.
	for _, plug in pairs(PM.plugs) do
		if plug.disable ~= true then
			-- plug.disable is false or nil
			if plug.repo then
				if isPlugDownloaded(plug.repo) then
					pendings[#pendings + 1] = plug
				else
					plug.disable = true
					plug.reason = 'uninstalled'
					plug.uninstalled = true
				end
			else
				pendings[#pendings + 1] = plug
			end
		end
	end

	for _, plug in pairs(pendings) do
		for _, depPlug in pairs(plug.requires or {}) do
			if depPlug.disable then
				local reason = string.format('Its required plugin "%s" is disabled', depPlug.id)
				disablePlug(plug, reason)
			end
		end
	end

	pendings = {}
	for _, plug in pairs(PM.plugs) do
		if plug.disable then
			if plug.uninstalled then
				notify(string.format('Plug "%s" has not installed. Try "%s" to install it.', plug.id,
					PM.P.cmds.install), { level = 'warn', defer = true })
			elseif plug.reason then
				notify(
					string.format('Plug "%s" has been loaded but not setup. Reason: %s', plug.id, plug.reason),
					{ level = 'warn', defer = true })
			else
				-- Some plugins are disabled by default or by user. So they have no reason and do not need to notify.
			end
		else
			local ok, msg = xpcall(Plug.mergePlugDefaultConfig, debug.traceback, CM.config, plug)
			if not ok then
				notify(string.format('[Plug: %s] Failed to mergePlugDefaultConfig. Reason: %s', plug.id, msg),
					{ level = 'error', defer = true })
			end
			pendings[#pendings + 1] = plug
		end
	end

	if PM.configFn then
		local userConfig = PM.configFn(config) or {}
		for key, value in pairs(userConfig) do config[key] = util.merge(config[key], value) end
	end

	for _, plug in pairs(pendings) do
		local ok, msg = xpcall(executePlugOptions, debug.traceback, plug, config)
		if not ok then
			notify(string.format('[Plug: %s] Failed to executePlugOptions. Reason: %s', plug.id, msg),
				{ level = 'error', defer = true })
		end
	end
end

function PM.setP(P)
	PM.P = P
end

-- @param path {string} require('one.plugins.' .. path)
-- @param [plugOpts] {table} The plug opts defined by user. They will override plugin default opts.
-- @return {table} Merged plug opts
local loadBuiltinPlugForUser = function(path, plugOpts)
	local opts = require('one.plugins.' .. path)
	if plugOpts then
		return vim.tbl_deep_extend('force', opts, plugOpts)
	else
		return opts
	end
end

local function setupUserPlugins(optPlugins)
	local userPlugins = PM.userPlugins
	local userPluginList = {}

	if type(optPlugins) == 'function' then --
		optPlugins = optPlugins(loadBuiltinPlugForUser, CM.config)
	end

	for i, p in pairs(optPlugins or {}) do
		local ok, plugOpts = xpcall(normalizeOpts, debug.traceback, p)
		if not ok then
			notify(string.format('Invalid user plugin at opts.plugins[%s]. Reason: %s', i, plugOpts), 'error')
		end

		userPlugins[plugOpts.id] = plugOpts
		userPluginList[#userPluginList + 1] = plugOpts -- For keeping plugins order
	end

	return userPluginList
end

function PM.setup(opts)
	local config = CM.config
	local conf = config.pluginManager
	local use = conf.use

	PM.configFn = opts.configFn
	PM.onlyPlugins = opts.onlyPlugins

	if PM.onlyPlugins and vim.tbl_isempty(PM.onlyPlugins) then return end

	local userPluginList = setupUserPlugins(opts.plugins)

	local P
	if use == 'vim-plug' then
		P = require('one.plugin-manager.vim-plug')
	elseif use == 'packer' then
		P = require('one.plugin-manager.packer')
	else
		error(string.format('Invalid value of config.pluginManager.use = %s', use))
	end

	PM.setP(P)

	P.setup {
		config = config,

		run = PM.run,

		loadPlugs = function()
			require('one.plugins')(PM.Plug, PM.LoadBuiltinPlug, config)
			local userPlugins = PM.userPlugins

			for _, p in pairs(userPluginList) do
				if userPlugins[p.id] then
					-- Append user plugins. More examples at ./lua/one/plugins.lua
					PM.Plug(p)
				end
			end
		end,
	}
end

function PM.clean()
	PM.index = 0
	PM.plugs = {}
	PM.plugMap = {}
	PM.userPlugins = {}
end

return PM
