return {
	'lukas-reineke/headlines.nvim',
	config = function(config)
		require('headlines').setup(config.headlines)
	end,

	defaultConfig = {
		'headlines',
		{
			markdown = {
				headline_highlights = { 'Headline' },
				codeblock_highlight = 'CodeBlock',
				dash_highlight = 'Dash',
				dash_string = '-',
				quote_highlight = 'Quote',
				quote_string = '┃',
				fat_headlines = false,
				fat_headline_upper_string = '▁',
				fat_headline_lower_string = '▔',
			},
		},
	},

	highlights = { Headline = { bg = '#172440' } },
}
