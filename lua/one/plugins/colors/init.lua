return {
	'colors',
	desc = 'color settings',

	deps = {
		require 'one.plugins.colors.highlights',
		require 'one.plugins.colors.inline',

		{
			'guns/xterm-color-table.vim',
			on = {
				'XtermColorTable',
				'SXtermColorTable',
				'VXtermColorTable',
				'TXtermColorTable',
				'EXtermColorTable',
				'OXtermColorTable',
			},
			desc = 'List xterm colors',
		},

		-- Do not use 'luochen1990/rainbow'. It has bug with treesitter.
	},
}
