return {
	'andymass/vim-matchup',
	desc = 'Extends vim\'s % motion to language-specific words.',

	config = function(config)
		local has_treesitter, treesitterConf = pcall(require, 'nvim-treesitter.configs')
		if has_treesitter then
			treesitterConf.setup { matchup = { enable = true, disable = config.matchup.disableLangs } }
		end

		require('match-up').setup(config.matchup.setup)
	end,

	defaultConfig = {
		'matchup',
		{
			-- The list of supported languages: https://github.com/andymass/vim-matchup/tree/master/after/queries
			disableLangs = {}, -- list of language that will be disabled

			-- https://github.com/andymass/vim-matchup#options
			setup = {
				sync = false,

				matchparen = {
					enabled = 1,
					stopline = 400,
					timeout = 300,
					insert_timeout = 60,
					deferred = 0,
					deferred_show_delay = 50,
					deferred_hide_delay = 700,
					hi_surround_always = 0,
				},

				motion = { enabled = 1, cursor_end = 1, override_Npercent = 6 },

				text_obj = {
					enabled = 1,
					linewise_operators = { 'd', 'y' }, -- enable "di%" to delete, "ya%" to yank
				},

				surround = { enabled = 1 },

				transmute = { enabled = 0 },

				delim = { stopline = 1500, noskips = 0 },
			},
		},
	},
}
