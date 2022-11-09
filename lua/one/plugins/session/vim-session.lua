local util = require('one.util')

local M = { 'xolox/vim-misc', requires = { 'xolox/vim-session' }, desc = 'session manage' }

M.defaultConfig = {
	'session',
	{
		directory = util.dataPath('session'),
		lock_directory = util.dataPath('session_lock'),
		autosave = 'yes',
		autoload = 'no',
	},
}

function M.config(config)
	local conf = config.session
	vim.g.session_directory = conf.directory
	vim.g.session_lock_directory = conf.lock_directory
	vim.g.session_autosave = conf.autosave
	vim.g.session_autoload = conf.autoload
end

return M
