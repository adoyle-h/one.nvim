return {
	'max397574/better-escape.nvim',

	-- keymaps = {
	-- { 'i', 'jk', '<Esc>', { noremap = true, silent = true, desc = 'Exit from input mode' } },
	-- },

	defaultConfig = {
		'escape',
		{
			timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default

			default_mappings = false,

			mappings = {
				i = {
					j = {
						-- These can all also be functions
						k = '<Esc>',
					},
				},
				c = {
					j = {
						k = '<Esc>',
					},
				},
				t = {
					j = {
						k = '<Esc>',
					},
				},
				v = {
					j = {
						k = '<Esc>',
					},
				},
				s = {
					j = {
						k = '<Esc>',
					},
				},
			},
		},
	},

	config = function(config)
		require('better_escape').setup(config.escape)
	end,
}
