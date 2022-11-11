return {
	'rainbowhxch/beacon.nvim',

	highlights = function(config)
		local c = config.colors
		return { Beacon = { bg = c.blue } }
	end,

	config = function(config)
		require('beacon').setup(config.beacon)
	end,

	defaultConfig = function(config)
		return {
			'beacon',
			{
				enable = true,
				size = 999,
				fade = true,
				fader = 'cursor_line',
				minimal_jump = 6,
				show_jumps = true,
				focus_gained = false,
				shrink = true,
				timeout = 3000,
				ignore_buffers = {},
				ignore_filetypes = config.ignore.fileTypesForSomePlugs,
			},
		}
	end,
}
