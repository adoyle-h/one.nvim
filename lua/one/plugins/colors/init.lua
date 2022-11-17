local config = require('one.config').config

return {
	'colors',
	desc = 'color settings',

	deps = {
		require('one.plugins.themes.' .. config.theme.use),
		require 'one.plugins.colors.highlights',
		require 'one.plugins.colors.ccc',

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
