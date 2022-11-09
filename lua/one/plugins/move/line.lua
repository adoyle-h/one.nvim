return {
	'nacro90/numb.nvim',
	config = function(config)
		require('numb').setup(config.move.line)
	end,

	defaultConfig = {
		{ 'move', 'line' },
		{
			show_numbers = true, -- Enable 'number' for the window while peeking
			show_cursorline = true, -- Enable 'cursorline' for the window while peeking
			hide_relativenumbers = true, -- Enable turning off 'relativenumber' for the window while peeking
			number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
			centered_peeking = true, -- Peeked line will be centered relative to window
		},
	},
}
