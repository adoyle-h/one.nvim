return {
	'lewis6991/satellite.nvim',

	config = function(config)
		require('satellite').setup(config.satellite)
	end,

	defaultConfig = {
		'satellite',
		{
			current_only = false,
			winblend = 50,
			zindex = 40,
			excluded_filetypes = {},
			width = 2,
			handlers = {
				search = { enable = true },
				diagnostic = { enable = true },
				gitsigns = {
					enable = false,
					signs = { -- can only be a single character (multibyte is okay)
						add = '│',
						change = '│',
						delete = '-',
					},
				},
				marks = {
					enable = true,
					show_builtins = false, -- shows the builtin marks like [ ] < >
				},
			},
		},
	},

	highlights = function(config)
		local c = config.colors
		return { ScrollView = { bg = c.scrollbarBG } }
	end,
}
