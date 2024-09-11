return {
	'max397574/better-escape.nvim',

	defaultConfig = {
		'escape',
		{
			timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default

			default_mappings = false,

			mappings = {
				i = {
					j = {
						k = '<Esc>',
					},
				},

				t = {
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
