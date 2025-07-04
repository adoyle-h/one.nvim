return {
	'hiphish/rainbow-delimiters.nvim',
	desc = 'Rainbow brackets',
	after = 'nvim-treesitter',

	config = function(config)
		require('rainbow-delimiters.setup').setup(config.rainbow)
	end,

	defaultConfig = {
		'rainbow',
		{
			-- NOTE: the value should be string
			strategy = {
				[''] = 'rainbow-delimiters.strategy.global',
				-- commonlisp = 'local',
			},
			query = {
				[''] = 'rainbow-delimiters',
				latex = 'rainbow-blocks',
				lua = 'rainbow-blocks',
			},
			priority = {
				[''] = 110,
				lua = 210,
			},
			highlight = {
				'RainbowDelimiter_1',
				'RainbowDelimiter_2',
				'RainbowDelimiter_3',
				'RainbowDelimiter_4',
				'RainbowDelimiter_5',
				'RainbowDelimiter_6',
				'RainbowDelimiter_7',
				'RainbowDelimiter_8',
				'RainbowDelimiter_9',
				'RainbowDelimiter_10',
			},
			blacklist = {
			},
		},
	},

	highlights = {
		RainbowDelimiter_1 = { fg = '#b54b33' },
		RainbowDelimiter_2 = { fg = '#1F4FFF' },
		RainbowDelimiter_3 = { fg = '#823EF8' },
		RainbowDelimiter_4 = { fg = '#00a887' },
		RainbowDelimiter_5 = { fg = '#82605f' },
		RainbowDelimiter_6 = { fg = '#82ab00' },
		RainbowDelimiter_7 = { fg = '#3e41be' },
		RainbowDelimiter_8 = { fg = '#12cf5f' },
		RainbowDelimiter_9 = { fg = '#8D2E8D' },
		RainbowDelimiter_10 = { fg = '#8787ff' },
	},
}
