local M = { 'colors.highlights', desc = 'Define highlight groups' }

local config = require('one.config').config
local c = config.colors
local set_hl = vim.api.nvim_set_hl

M.defaultConfig = {
	'highlights',
	{
		-- Or 'MyCursor' = function(colors) return { bg = colors.blue } end,
		MyCursor = { bg = c.blue },
		Visual = { bg = c.darkOrange, fg = c.white },
		QuickFixLine = { bg = c.darkYellow, bold = true },
		Whitespace = { fg = c.yellow }, -- 'listchars'
		NonText = { fg = c.grey3, bg = 'NONE' },
		Title = { fg = c.blue },
		ColorColumn = { bg = c.grey1 },

		NormalFloat = { bg = c.black }, -- Float Window
		FloatBorder = { bg = c.black, fg = c.blue }, -- Float Window Border
		MatchParen = { fg = c.match.fg, bg = c.black, underline = true },
		DiagnosticVirtualTextError = { fg = c.red },

		-- Syntax Highlights
		Comment = { fg = c.comment }, -- Comments
		Constant = { fg = '#83B1A5' }, -- (preferred) any constant
		String = { fg = c.green }, --   a string constant: "this is a string"
		Character = { link = 'String' }, -- single character constant: 'c', '\n'
		Number = { fg = c.orange }, -- a number constant: 234, 0xff
		Float = { link = 'Number' }, -- a floating point constant: 2.3e10
		Boolean = { fg = '#79C0FF' }, -- a boolean constant: TRUE, false
		Identifier = { fg = '#B63636' }, -- (preferred) any variable name
		Function = { fg = '#5395F9' }, -- function name (also: methods for classes)
		Statement = { fg = c.purple }, -- (preferred) any statement
		Conditional = { link = 'Keyword' }, --  if, then, else, endif, switch, etc
		Repeat = { link = 'Keyword' }, -- keywords related to loops. e.g. for, do, while, etc
		Label = { link = 'Keyword' }, -- case, default, etc.
		Operator = { fg = c.cyan }, -- "sizeof", "+", "*", etc
		Keyword = { fg = c.purple }, -- any other keyword
		Exception = { link = 'Keyword' }, -- try, catch, throw
		PreProc = { fg = c.blue }, -- (preferred) generic Preprocessor
		Include = { fg = '#7B59E2' }, -- preprocessor #include
		Define = { fg = c.blue }, -- preprocessor #define
		Macro = { link = 'Define' },
		PreCondit = { link = 'Define' }, -- preprocessor #if, #else, #endif, etc
		Type = { fg = '#C9853E' }, -- (preferred) int, long, char, etc
		StorageClass = { fg = c.yellow }, -- static, register, volatile, etc
		Structure = { fg = c.purple }, -- struct, union, enum, etc
		Typedef = { fg = c.purple }, -- A typedef
		Special = { fg = c.yellow }, -- (preferred) any special symbol.
		SpecialChar = { fg = c.cyan }, -- special character in a constant
		Tag = { fg = c.red }, -- Tags like html tag names. you can use CTRL-] on this
		Delimiter = { fg = c.white }, -- character that needs attention
		SpecialComment = { fg = c.comment }, -- special things inside a comment
		-- Debug = {}, -- debugging statements
		Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
		Bold = { bold = true },
		Ignore = {}, -- (preferred) left blank, hidden  |hl-Ignore|
		Italic = { italic = true },
		Error = { fg = c.red }, -- (preferred) any erroneous construct
		Warn = { fg = c.yellow },
		Todo = { fg = c.purple }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
	},
}

function M.config()
	vim.api.nvim_create_autocmd({ 'VimEnter' }, {
		callback = function()
			for group, opts in pairs(config.highlights) do
				if type(opts) == 'function' then opts = opts(c) end
				set_hl(0, group, opts)
			end
		end,
	})
end

return M
