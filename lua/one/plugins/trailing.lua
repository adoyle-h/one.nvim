return {
	'johnfrankmorgan/whitespace.nvim',
	desc = 'highlight trailing spaces',

	highlights = function(config)
		return { TrailingWhitespace = { bg = config.colors.grey } }
	end,

	commands = {
		TrailingSpaces = {
			function()
				require('whitespace-nvim').trim()
			end,
			{ desc = 'Remove trailing spaces' },
		},
	},

	config = function(config)
		require('whitespace-nvim').setup(config.whitespace)
	end,

	defaultConfig = function(config)
		return {
			'whitespace',
			{
				highlight = 'TrailingWhitespace',

				-- `ignored_filetypes` configures which filetypes to ignore when displaying trailing whitespace
				ignored_filetypes = config.ignore.fileTypesForSomePlugs,
			},
		}
	end,
}
