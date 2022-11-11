return {
	'edluffy/specs.nvim',

	highlights = function(config)
		local c = config.colors
		return { CursorLineFader = { bg = c.blue } }
	end,

	commands = {
		ShowCursor = {
			function()
				require('specs').show_specs()
			end,
		},
	},

	config = function(config)
		require('specs').setup(config.specs)
	end,

	defaultConfig = function(config)
		return {
			'specs',
			{
				show_jumps = true,
				min_jump = 6,
				popup = {
					delay_ms = 0, -- delay before popup displays
					inc_ms = 10, -- time increments used for fade/resize effects
					blend = 60, -- starting blend, between 0-100 (fully transparent), see :h winblend
					width = 60,
					winhl = 'CursorLineFader',
					fader = require('specs').linear_fader,
					resizer = require('specs').shrink_resizer,
				},
				ignore_filetypes = config.ignore.fileTypesForSomePlugs,
				ignore_buftypes = { nofile = true },
			},
		}
	end,
}
