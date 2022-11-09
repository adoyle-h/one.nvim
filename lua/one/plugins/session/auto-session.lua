local util = require('one.util')

local Auto = {
	'rmagatti/auto-session',

	config = function(config)
		vim.o.sessionoptions = config.session.session_options
		require('auto-session').setup(config.session.main)
	end,

	defaultConfig = {
		{ 'session', 'main' },
		{
			log_level = 'warn',
			auto_session_enable_last_session = true,
			auto_session_root_dir = util.dataPath('sessions'),
			auto_session_enabled = true,
			auto_session_create_enabled = true,
			auto_save_enabled = nil,
			auto_restore_enabled = nil,
			auto_session_suppress_dirs = {},
			auto_session_use_git_branch = false,
			bypass_session_save_file_types = { 'alpha', 'neo-tree' },
			cwd_change_handling = {
				restore_upcoming_session = true, -- already the default, no need to specify like this, only here as an example
				pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
				post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
					require('lualine').refresh() -- refresh lualine so the new session name is displayed in the status bar
				end,
			},
		},
	},

}

local Lens = {
	'rmagatti/session-lens',

	defaultConfig = {
		{ 'session', 'lens' },
		{
			-- prompt_title = '',
			path_display = {
				shorten = {
					len = 2, -- shorten into 2 letters
					exclude = { 1, -2, -1 }, -- exclude the first, the last and last second words in path
				},
			},
			theme_conf = { border = true },
			previewer = true,
		},
	},

	config = function(config)
		require('session-lens').setup(config.session.lens)
	end,
}

local M = {
	requires = { Auto, Lens },

	defaultConfig = {
		{ 'session' },
		{ session_options = 'blank,curdir,folds,help,tabpages,winpos,winsize' },
	},

	config = function(config)
		vim.o.sessionoptions = config.session.session_options
	end,
}

return M
