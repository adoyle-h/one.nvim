return {
	'johnfrankmorgan/whitespace.nvim',
	-- @TODO remove below line after [the issue](https://github.com/johnfrankmorgan/whitespace.nvim/issues/13) fixed.
	commit = '406cd69216dd7847b0cb38486603a8ed5c4f8c77',
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
				-- `highlight` configures which highlight is used to display trailing whitespace
				highlight = 'TrailingWhitespace',

				-- `ignored_filetypes` configures which filetypes to ignore when displaying trailing whitespace
				ignored_filetypes = config.ignore.fileTypesForSomePlugs,

				-- `ignore_terminal` configures whether to ignore terminal buffers
				ignore_terminal = true,

				-- `return_cursor` configures if cursor should return to previous position after trimming whitespace
				return_cursor = true,
			},
		}
	end,
}
