return {
	'telescope',

	requires = { require('one.plugins.telescope.main') },

	deps = {
		{
			-- TODO: Waiting the PR merged: https://github.com/nvim-telescope/telescope-live-grep-args.nvim/pull/88
			-- 'nvim-telescope/telescope-live-grep-args.nvim',
			-- version = '^1.0.0',
			'adoyle-h/telescope-live-grep-args.nvim',
			branch = 'a',
			config = function()
				require('telescope').load_extension('live_grep_args')
			end,
		},

		{
			'keyvchan/telescope-find-pickers.nvim',
			desc = 'Find all pickers available (includes builtins and extensions)',
			config = function()
				require('telescope').load_extension('find_pickers')
			end,
		},

		{
			'adoyle-h/telescope-extension-maker.nvim',
			config = function()
				local One = require('one.one')
				One.telescope = require('telescope-extension-maker')
			end,
		},

		{
			'adoyle-h/ad-telescope-extensions.nvim',

			keymaps = { { 'n', '<C-w><C-w>', ':Telescope windows<cr>', { silent = true } } },

			config = function(config)
				local util = require('one.util')

				require('ad-telescope-extensions').setup {
					enable = 'all',
					floaterm = { alias = 'terminals' },
					windows = {
						opts = {
							excludeFileTypes = config.ignore.fileTypesForSomePlugs,
							tab = function(props)
								return 'Tab ' .. props.tab .. util.superNum(#props.wins)
							end,
						},
					},
				}
			end,
		},

		{
			'crispgm/telescope-heading.nvim',
			config = function()
				require('telescope').load_extension('heading')
			end,
		},
	},

	keymaps = require('one.plugins.telescope.keymaps'),
	highlights = require('one.plugins.telescope.highlights'),
	telescopes = require('one.plugins.telescope.extensions'),
}
