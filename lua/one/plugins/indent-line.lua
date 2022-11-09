local config = require('one.config').config
local colors = config.colors

local M = {
	'lukas-reineke/indent-blankline.nvim',
	desc = 'Show indent line',

	highlights = {
		IndentBlanklineChar = { fg = colors.grey1 },
		IndentBlanklineContextChar = { fg = colors.purple },
	},
}

M.defaultConfig = {
	'indentLine',
	{
		line = '▏', -- '┊', '', '⎜', '⎸', '│', '⎜', '⎜', '⎜'
		excludeFileType = {
			'alpha', -- goolord/alpha-nvim, see plugins/alpha.lua
		},
		opts = { -- :h indent_blankline
			-- space_char_blankline = " ",
			show_current_context = true,
			show_current_context_start = false,
		},
	},
}

function M.config()
	local conf = config.indentLine

	vim.g.indent_blankline_char = conf.line
	vim.g.indent_blankline_filetype_exclude = conf.excludeFileType

	require('indent_blankline').setup(conf.opts)
end

return M
