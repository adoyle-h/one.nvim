local util = require('one.util')
local pUtil = require('one.plugin-manager.util')

local P = {}

P.cmds = { install = ':Lazy install<CR>', status = ':Lazy home<CR>' }

-- Some fields is ignored. Because PluginManager has implemented these functions.
local fields = {
	-- LuaFormatter off
	--[[ 'config','dependencies', ]]
	'dir', 'url', 'name', 'dev', 'lazy', 'enabled', 'cond', setup = 'init', 'opts',
	run = 'build', 'branch', tag = 'version', 'commit', 'version', 'pin', 'submodules',
	'event', 'cmd', 'ft', 'keys', 'module', 'priority',
	-- LuaFormatter on
}

local function parseOpts(repo, opts)
	local plugOpts = pUtil.parseOpts(fields, opts, { repo })

	local deps = {}
	for _, depPkg in pairs(opts.requires or {}) do
		if depPkg.repo then deps[#deps + 1] = util.getRepoName(depPkg.repo) end
	end
	for _, depPkg in pairs(opts.deps or {}) do
		if depPkg.repo then deps[#deps + 1] = util.getRepoName(depPkg.repo) end
	end
	if not vim.tbl_isempty(deps) then plugOpts.dependencies = deps end

	return plugOpts
end

-- @param params see lua/one/plugin-manager/init.lua
function P.setup(params)
	local config = params.config
	local lazyOpts = config.pluginManager.lazy
	local lazyConfig = lazyOpts.config

	local isNew = util.ensurePkg { -- ensure packer.nvim downloaded
		url = lazyOpts.src,
		dist = lazyOpts.dist,
		branch = lazyOpts.srcBranch,
	}
	-- if isNew then util.packadd(lazyOpts.dist) end
	vim.opt.rtp:prepend(lazyOpts.dist)

	lazyConfig.git.url_format = util.proxyGithub(lazyConfig.git.url_format)

	local lazy = require('lazy')

	local plugins = {}

	P.loadPlug = function(repo, opts)
		local plugOpts = parseOpts(repo, opts)
		plugins[#plugins + 1] = plugOpts
	end

	P.lazyConfig = lazyConfig

	vim.keymap.set('n', '<SPACE>P', P.cmds.status, { desc = 'Show Plugin Status' })

	params.loadPlugs()

	vim.api.nvim_create_autocmd('User', {
		pattern = 'LazyDone',
		callback = function()
			-- The packer compiled file is already loaded by PackerSync
			params.run(isNew)
		end,
	})

	lazy.setup(plugins, lazyConfig)

	return isNew
end

function P.getPluginFolderPath(folderName)
	return util.pathJoin(P.lazyConfig.root, folderName)
end

return P
