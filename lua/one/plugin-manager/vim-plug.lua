-- The packer.nvim is terrible. Use vim-plug! https://github.com/junegunn/vim-plug
local util = require('one.util')

local P = {}

P.cmds = { install = 'PlugInstall', status = 'PlugStatus' }

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

	vim.keymap.set('n', '<SPACE>P', ':PlugStatus<CR>', { desc = 'Show Plugin Status' })

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
local function parseOpts(opts)
	local plugOpts = {}
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
	for k, v in pairs(fields) do
		plugOpts[v] = opts[v]
		if type(k) == 'string' then plugOpts[v] = opts[k] end
	end

	return plugOpts
end

function P.loadPlug(repo, opts)
	local plugOpts = parseOpts(opts)
	local loadPlug = vim.fn['plug#']

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
