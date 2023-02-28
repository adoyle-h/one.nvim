local M = {
	'one-theme',
	config = function(config)
		local conf = config['one-theme']
		vim.opt.fillchars = conf.fillchars
	end,
}

M.defaultConfig = {
	'one-theme',
	{
		fillchars = { -- :h 'fcs'
			horiz = ' ',
			horizup = ' ',
			horizdown = ' ',
			vert = ' ',
			vertleft = ' ',
			vertright = ' ',
			verthoriz = ' ',
		},
	},
}

M.highlights = function(config)
	local c = config.colors
	return {
		MyCursor = { bg = c.blue }, -- No work for current

		-- Syntax Highlights
		Comment = { fg = c.comment }, -- Comments
		Constant = { fg = '#83B1A5' }, -- (preferred) any constant
		String = { fg = c.green }, --   a string constant: "this is a string"
		Character = { link = 'String' }, -- single character constant: 'c', '\n'
		Number = { fg = c.orange }, -- a number constant: 234, 0xff
		Float = { link = 'Number' }, -- a floating point constant: 2.3e10
		Boolean = { fg = '#79C0FF' }, -- a boolean constant: TRUE, false
		Identifier = { fg = '#B64F2E' }, -- (preferred) any variable name
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
		qfLineNr = { link = 'LineNr' },
		qfFileName = { link = 'Directory' },

		-- Editor Highlights
		ColorColumn = { bg = c.ColorColumnBG }, -- used for the columns set with 'colorcolumn'
		Conceal = { fg = c.white }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { bg = c.purple, fg = c.black }, -- character under the cursor
		-- lCursor      = {}, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM     = {bg = c.red}, -- like Cursor, but used when in IME mode |CursorIM|
		CursorColumn = { link = 'CursorLine' }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine = { bg = c.cursorLine }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		CursorLineNr = { bg = c.cursorLineNrBG, fg = c.cursorLineNrFG }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		CursorLineNrNC = { bg = c.NC_BG, fg = c.grey }, -- CursorLineNr for inactive windows
		CursorLineNrNCQuickFix = { bg = c.NC_BG, fg = c.cursorLineNrFG }, -- CursorLineNr for inactive quickfix windows
		Directory = { fg = c.blue }, -- directory names (and other special names in listings)
		DiffAdd = c.diff.add, -- diff mode: Added line |diff.txt|
		DiffChange = c.diff.change, -- diff mode: Changed line |diff.txt|
		DiffDelete = c.diff.delete,
		DiffText = c.diff.text, -- diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer = { fg = c.black }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		ErrorMsg = { fg = c.red }, -- error messages on the command line
		VertSplit = { link = 'WinSeparator' }, -- the column separating vertically split windows
		Folded = { bg = c.grey3, fg = c.grey }, -- line used for closed folds
		FoldedNC = { bg = c.NC_BG, fg = c.grey }, -- Folded for inactive windows
		FoldColumn = { bg = c.BG, fg = c.grey }, -- 'foldcolumn'
		SignColumn = { bg = c.BG }, -- column where |signs| are displayed
		SignColumnNC = { bg = c.NC_BG, fg = c.grey }, -- SignColumn for inactive windows
		Substitute = { bg = c.yellow, fg = c.black }, -- |:substitute| replacement text highlighting
		LineNr = { bg = c.BG, fg = c.grey }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		LineNrNC = { bg = c.NC_BG, fg = c.grey }, -- LineNr for inactive windows
		MatchParen = { fg = c.cyan }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg = { link = 'Normal' }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea = { link = 'ModeMsg' }, -- Area for messages and cmdline
		MsgSeparator = { link = 'ModeMsg' }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg = { fg = c.green }, -- |more-prompt|
		NonText = { fg = c.grey3, bg = nil }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal = { bg = c.BG, fg = c.white }, -- normal text
		NormalNC = { bg = c.NC_BG, fg = c.white }, -- normal text in non-current windows
		NormalFloat = { bg = c.floatWinBG, fg = c.white }, -- Normal text in floating windows.
		FloatBorder = { bg = c.floatWinBG, fg = c.blue },
		Pmenu = { link = 'NormalFloat' }, -- Popup menu: normal item.
		PmenuSel = { bg = c.menuItemBG }, -- Popup menu: selected item.
		PmenuSbar = { bg = c.scrollbarBG }, -- Popup menu: scrollbar.
		PmenuThumb = { bg = c.blue }, -- Popup menu: Thumb of the scrollbar.
		Question = { bg = c.BG, fg = c.grey }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine = { bg = c.darkYellow, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		QuickFixLineNC = { bg = c.NC_BG }, -- QuickFixLine, for inactive windows
		Search = { bg = c.darkOrange, fg = c.yellow }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		SpecialKey = { fg = c.cyan, undercurl = true, bold = true }, -- Unprintable characters: Text displayed differently from what it really is. But not 'listchars' whitespace.
		IncSearch = { link = 'Search' }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		CurSearch = { link = 'Search' }, -- Used for highlighting a search pattern under the cursor
		StatusLine = { bg = c.black, fg = c.white, bold = true }, -- status line of current window
		StatusLineNC = { bg = c.NC_BG, fg = c.white }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine = { bg = c.black }, -- tab pages line, not active tab page label
		TabLineFill = { bg = c.black, fg = c.white }, -- tab pages line, where there are no labels
		TabLineSel = { bg = c.purple, fg = c.black }, -- tab pages line, active tab page label
		TermCursor = { bg = c.purple }, -- cursor in a focused terminal
		TermCursorNC = { bg = c.NC_BG }, -- cursor in an unfocused terminal
		Title = { fg = c.blue }, -- titles for output from ":set all", ":autocmd"
		Visual = { bg = c.darkOrange, fg = c.white }, -- Visual mode selection
		VisualNOS = { link = 'Visual' }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg = { fg = c.yellow }, -- warning messages
		WinBar = { bg = c.BG, fg = c.white },
		WinBarNC = { -- inactive window bar
			bg = c.NC_BG,
			fg = c.white,
		},
		WinSeparator = { bg = c.WinSeparatorBG, fg = c.grey }, -- the column separating windows
		Whitespace = { fg = c.yellow }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu = { bg = c.blue, fg = c.black }, -- current match in 'wildmenu' completion

		-- Git
		diffAdded = { fg = c.git.add },
		diffChanged = { fg = c.git.change },
		diffRemoved = { fg = c.git.delete },
		diffFile = { fg = c.git.change },
		diffNewFile = { fg = c.git.change },
		diffLine = { fg = c.blue },

		-- Spelling
		SpellBad = { fg = c.red, sp = c.red, undercurl = true },
		SpellCap = { fg = c.red, sp = c.red, undercurl = true },
		SpellLocal = { fg = c.red, sp = c.red, undercurl = true },
		SpellRare = { fg = c.red, sp = c.red, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
	}
end

-- local ns = vim.api.nvim_create_namespace('one-theme')
-- M.autocmds = { WinEnter = {}, WinLeave = {} }

return M
