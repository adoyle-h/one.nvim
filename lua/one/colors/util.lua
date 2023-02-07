local M = {}

-- @param bc {table} basic colors
-- @param fc {table} functional colors
-- @return {table} colors
function M.make(bc, fc)
	return vim.tbl_deep_extend('force', bc, {
		cursorLine = bc.darkBlue,
		cursorLineNrFG = bc.blue,
		cursorLineNrBG = bc.darkBlue,

		linkFG = fc.linkFG,
		comment = bc.grey,
		scrollbarBG = fc.scrollbarBG,

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
