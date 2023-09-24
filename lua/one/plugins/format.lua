return {
	'format',
	desc = 'Format Settings',

	deps = {
		require('one.plugins.align'),

		{ 'editorconfig/editorconfig-vim', desc = '.editorconfig support' },

		{
			'rhlobo/vim-super-retab',
			on = { 'Space2Tab', 'Tab2Space' },
			desc = 'Convert spaces to tabs, or tabs to spaces',
		},

		{ 'tpope/vim-sleuth', desc = 'Auto set shiftwidth expandtab based on text context' },

		{
			'mhartington/formatter.nvim',

			config = function(config)
				require('formatter').setup(config.formatter)
			end,

			defaultConfig = {
				'formatter',
				{
					-- Enable or disable logging
					logging = true,
					-- Set the log level
					log_level = vim.log.levels.WARN,
					-- All formatter configurations are opt-in
					filetype = {
						-- Formatter configurations for filetype "lua" go here
						-- and will be executed in order

						-- Use the special "*" filetype for defining formatter configurations on
						-- any filetype
						-- ['*'] = {
						-- 	-- "formatter.filetypes.any" defines default configurations for any
						-- 	-- filetype
						-- 	require('formatter.filetypes.any').remove_trailing_whitespace,
						-- },
					},
				},
			},
		},
	},
}
