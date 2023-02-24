-- The packer.nvim is terrible. Use vim-plug! https://github.com/junegunn/vim-plug
local util = require('one.util')
local pUtil = require('one.plugin-manager.util')

local P = {}

P.cmds = { install = ':PlugInstall<CR>', status = ':PlugStatus<CR>' }

function P.setup(params)
	local conf = params.config.pluginManager['vim-plug']

	local isNew = util.ensureFile { url = conf.src, dist = conf.dist }
	if isNew then vim.cmd.source(conf.dist) end

	for key, val in pairs(conf) do vim.g['plug_' .. key] = val end

	if conf.window == 'VimPlugFloatWindow' then
		vim.api.nvim_create_user_command('VimPlugFloatWindow', util.floatWindow,
			{ desc = 'Create float window for VimPlug' })
	end

	vim.g.plug_url_format = util.proxyGithub(vim.g.plug_url_format) -- Use git proxy for fast downloading

	vim.call('plug#begin', vim.g.plug_pluginDir)
	params.loadPlugs()
	vim.call('plug#end')

	if isNew then vim.cmd('PlugInstall') end

	params.run(isNew)

	return isNew
end

-- Vim-Plug Options:
-- branch/tag/commit : Branch/tag/commit of the repository to use
--               rtp : Subdirectory that contains Vim plugin
--               dir : Custom directory for the plugin
--                as : Use different name for the plugin
--   do (alias: run) : Post-update hook (string or funcref)
--   on (alias: cmd) : On-demand loading: Commands or <Plug>-mappings
--               for : On-demand loading: File types
--            frozen : Do not update unless explicitly specified

-- @param params see lua/one/plugin-manager/init.lua
local fields = {
	'branch',
	'tag',
	'commit',
	'rtp',
	'dir',
	'as',
	run = 'do',
	cmd = 'on',
	ft = 'for',
	lock = 'frozen',
}

function P.notifyInvalidOpts(repo)
	vim.notify(string.format(
		'[vim-plug][repo %s] Not support a lua function as "run" parameter. Please call the "run" funciton by yourself.',
		repo), 'warn')
end

function P.loadPlug(repo, opts)
	local plugOpts = pUtil.parseOpts(fields, opts)
	local loadPlug = vim.fn['plug#']

	if type(plugOpts['do']) == 'function' then
		plugOpts['do'] = string.format(
			':lua require("one.plugin-manager.vim-plug").notifyInvalidOpts("%s")', repo)
	end

	if vim.tbl_isempty(plugOpts) then
		loadPlug(repo)
	else
		loadPlug(repo, plugOpts)
	end
end

function P.getPluginFolderPath(folderName)
	return util.pathJoin(vim.g.plug_pluginDir, folderName)
end

return P
