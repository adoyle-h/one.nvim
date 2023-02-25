local M = {}

-- @param bc {table} basic colors
-- @param fc {table} functional colors
-- @return {table} colors
function M.make(bc, fc)
	return vim.tbl_deep_extend('force', bc, {
		cursorLine = fc.cursorLine or bc.darkBlue,
		cursorLineNrFG = bc.blue,
		cursorLineNrBG = fc.cursorLine or bc.darkBlue,

		BG = fc.BG or bc.black,
		NC_BG = fc.NC_BG or bc.grey1,
		WinSeparatorBG = fc.WinSeparatorBG,
		ColorColumnBG = fc.ColorColumnBG or bc.grey2,
		floatWinBG = bc.black,

		linkFG = fc.linkFG,
		comment = bc.grey,
		scrollbarBG = fc.scrollbarBG,
		menuItemBG = fc.menuItemBG or bc.darkBlue,

		match = { fg = bc.orange },

		git = { -- git colors. only fg colors
			add = bc.green,
			change = bc.yellow,
			delete = bc.red,
		},

		diff = { -- diff color styles
			add = { bg = bc.darkGreen },
			delete = { fg = bc.red, bg = bc.darkRed },
			change = { bg = bc.darkYellow },
			text = { bg = fc.diff.text.bg },
		},
	}, fc)
end

return M
