local config = require('one.config').config
local colors = config.colors

return {
	'https://gitlab.com/yorickpeterse/nvim-window.git',

	defaultConfig = {
		'window-selector',
		{
			-- The characters available for hinting windows.
			chars = {
				-- LuaFormatter off
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
				'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
				-- LuaFormatter on
			},

			-- A group to use for overwriting the Normal highlight group in the floating
			-- window. This can be used to change the background color.
			normal_hl = 'NvimWindowFloating',

			-- The highlight group to apply to the line that contains the hint characters.
			-- This is used to make them stand out more.
			hint_hl = 'Bold',

			-- The border style to use for the floating window.
			border = 'rounded', -- ':h nvim_open_win'
		},
	},

	highlights = { NvimWindowFloating = { fg = colors.blue, bg = colors.black } },

	config = function()
		require('nvim-window').setup(config['window-selector'])
	end,

	keymaps = function()
		return { { 'n', '-', require('nvim-window').pick, { desc = 'choose window', silent = true } } }
	end,
}
