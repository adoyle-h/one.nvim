return {
	'norcalli/nvim-colorizer.lua',

	config = function(config)
		local conf = config.colorizer
		require('colorizer').setup(conf.filetypes, conf.options)
	end,

	defaultConfig = {
		{ 'colorizer' },
		-- https://github.com/norcalli/nvim-colorizer.lua#customization
		{
			filetypes = { '*' },
			options = {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = true, -- 'Name' codes like Blue
				RRGGBBAA = false, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
				-- Available modes: foreground, background
				mode = 'background', -- Set the display mode.
			},
		},
	},
}
