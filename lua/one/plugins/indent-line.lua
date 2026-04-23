local config = require('one.config').config
local colors = config.colors

local M = {
	'lukas-reineke/indent-blankline.nvim',
	desc = 'Show indent line',
	after = 'nvim-treesitter',
}

M.defaultConfig = {
	'indentLine',
	{
		-- :h ibl
		enabled = true,
		debounce = 100,

		indent = {
			char = '▏', -- '┊', '󰇙', '⎜', '⎸', '│', '⎜', '⎜', '⎜'
			tab_char = '▏',
			highlight = 'IblIndent',
			smart_indent_cap = true,
			priority = 1,
			repeat_linebreak = true,
		},

		whitespace = {
			highlight = 'IblWhitespace',
			remove_blankline_trail = false,
		},

		scope = {
			enabled = true,
			show_start = false,
			show_end = false,
			injected_languages = true,
			highlight = 'IblScope',
			priority = 1024,
		},

		exclude = {
			filetypes = { 'alpha' },
			buftypes = { 'terminal' },
		},
	},
}

function M.config()
	vim.api.nvim_set_hl(0, 'IblWhitespace', { bg = colors.black })
	vim.api.nvim_set_hl(0, 'IblIndent', { fg = colors.grey2 })
	vim.api.nvim_set_hl(0, 'IblScope', { fg = colors.purple })
	require('ibl').setup(config.indentLine)
end

return M
