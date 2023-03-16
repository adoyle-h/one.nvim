return {
	'kevinhwang91/nvim-hlslens',
	desc = 'Highlight search floating',

	config = function(config)
		-- When nvim-scrollbar is enabled, call hlslens.setup in nvim-scrollbar
		if require('one').PM.isPlugDisabled('petertriho/nvim-scrollbar') then
			require('hlslens').setup(config.hlslens)
		end
	end,

	defaultConfig = {
		'hlslens',
		{ calm_down = true, nearest_only = true, nearest_float_when = 'always' },
	},

	highlights = function(config)
		local colors = config.colors
		local mainColor = colors.match.fg
		local bgColor = colors.grey1

		return {
			Search = { bg = 'none', fg = mainColor, underline = true },
			IncSearch = { bg = 'none', fg = mainColor, underline = true },
			-- 1. HlSearchLensNear: highlight the nearest virtual text
			HlSearchLensNear = { bg = bgColor, fg = mainColor },
			-- 2. HlSearchLens: highlight virtual text except for the nearest one
			HlSearchLens = { bg = bgColor, fg = colors.grey },
			-- 3. HlSearchNear: highlight the nearest matched instance
			HlSearchNear = { bg = mainColor, fg = colors.black },
			-- 4. HlSearchFloat: highlight the nearest text for the floating window
			HlSearchFloat = { bg = bgColor, fg = mainColor },
		}
	end,
}
