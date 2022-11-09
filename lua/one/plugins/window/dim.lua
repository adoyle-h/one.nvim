return {
	'sunjon/shade.nvim',
	desc = 'Dim inactive windows',
	disable = true,
	-- BUG: Neovim not rendering the correct color when an underline is overlayed by a transparent floating window.
	-- https://github.com/sunjon/Shade.nvim/issues/12
	-- https://github.com/neovim/neovim/issues/14453
	-- BUG: Noisy "off" print
	-- https://github.com/sunjon/Shade.nvim/issues/38

	defaultConfig = {
		{ 'window', 'shade' },
		{
			overlay_opacity = 40,
			opacity_step = 1,
			keys = { --
				brightness_up = '<C-Up>',
				brightness_down = '<C-Down>',
				toggle = '<Leader>sd',
			},
		},
	},

	config = function(config)
		local shade = require('shade')
		shade.setup(config.window.shade)
		shade.toggle()
	end,
}
