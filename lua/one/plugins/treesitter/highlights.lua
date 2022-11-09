-- Use :TSCaptureUnderCursor to get highlight group of text
-- Color schema references:
-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Colorschemes
-- https://github.com/rockerBOO/awesome-neovim#tree-sitter-supported-colorscheme
return function(config)
	local c = config.colors

	return {
		-- Misc
		['@none'] = { bg = 'NONE', fg = 'NONE' },
		['@define'] = { link = 'Define' },
		['@operator'] = { link = 'Operator' }, -- For any operator: `+`, but also `->` and `*` in theme.config.
		['@annotation'] = { fg = c.cyan }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
		['@attribute'] = { link = 'PreProc' },
		['@preproc'] = { link = 'PreProc' },
		['@note'] = { fg = c.black, bg = c.cyan },

		-- Diagnostic
		['@error'] = { link = 'Error' },
		['@warning'] = { link = 'Warn' },
		['@danger'] = { link = '@error' },

		-- Punctuation
		['@punctuation.delimiter'] = { link = 'Delimiter' }, -- For delimiters ie: `.`
		['@punctuation.bracket'] = { link = 'Delimiter' }, -- For brackets and parens.
		['@punctuation.special'] = { link = 'Delimiter' }, -- For special punctutation that does not fall in the categories before.

		-- Literals
		['@string'] = { link = 'String' },
		['@string.regex'] = { fg = '#47A169' },
		['@string.escape'] = { link = 'SpecialChar' }, -- For escape characters within a string.
		['@string.special'] = { link = 'SpecialChar' }, -- For strings with special meaning that don't fit into the above categories.

		['@comment'] = { link = 'Comment' }, -- For comment blocks.
		['@character'] = { link = 'Character' },
		['@character.special'] = { link = 'SpecialChar' },

		['@boolean'] = { link = 'Boolean' },
		['@number'] = { link = 'Number' }, -- For integers.
		['@float'] = { link = 'Float' }, -- For floats.

		-- Functions
		['@function'] = { link = 'Function' },
		['@function.call'] = { link = 'Function' },
		['@function.builtin'] = { fg = '#3D84FF' }, -- For builtin functions: `pairs`, `pcall`, `table.insert` in Lua.
		['@function.macro'] = { link = 'Macro' }, -- For macro defined functions (calls and definitions)
		['@method'] = { link = 'Function' },
		['@method.call'] = { link = 'Function' },
		['@constructor'] = { link = 'Special' }, -- For constructor calls and definitions
		['@parameter'] = { link = 'Identifier' },
		['@parameter.reference'] = { link = 'Identifier' }, -- For references to parameters of a function.

		-- Keywords
		['@keyword'] = { link = 'Keyword' },
		['@keyword.function'] = { fg = '#124FF2' },
		['@keyword.operator'] = { fg = c.purple, italic = true }, -- e.g. `and`, `as`, `or`.
		['@keyword.return'] = { fg = '#96C726' },

		['@conditional'] = { link = 'Conditional' },
		['@repeat'] = { link = 'Repeat' },
		['@debug'] = { link = 'Debug' },
		['@label'] = { link = 'Label' }, -- case, default, etc.
		['@include'] = { link = 'Include' },
		['@exception'] = { link = 'Exception' }, -- For exception related keywords.

		-- Types
		['@type'] = { link = 'Type' },
		['@type.builtin'] = { fg = '#DB852C' },
		['@type.qualifier'] = { link = 'Type' },
		['@type.definition'] = { link = 'Typedef' },

		['@storageclass'] = { link = 'StorageClass' },
		['@field'] = { fg = '#A39D80' }, -- #75902F #90852F '#C75D14'
		['@property'] = { fg = '#5098A3' },

		-- Identifiers
		['@variable'] = { fg = c.white },
		['@variable.builtin'] = { link = 'Special' }, -- like `this` or `self`.

		['@constant'] = { link = 'Constant' },
		['@constant.builtin'] = { fg = c.purple }, -- builtin constant: `nil` in Lua.
		['@constant.macro'] = { link = 'Constant' }, -- constants defined by macros: `NULL` in theme.config.

		['@namespace'] = { link = 'Include' },
		['@symbol'] = { link = 'Identifier' }, -- For identifiers referring to symbols or atoms.

		-- Text
		['@text'] = { fg = c.white }, -- For strings considered text in a markup language.
		['@text.strong'] = { link = 'Bold' },
		['@text.emphasis'] = { italic = true },
		['@text.underline'] = { link = 'Underlined' },
		['@text.strike'] = { strikethrough = true },
		['@text.title'] = { link = 'Title' },
		['@text.literal'] = { link = 'String' },
		['@text.uri'] = { link = 'Underlined' },
		['@text.math'] = { link = 'Special' },
		['@text.environment'] = { link = 'Macro' },
		['@text.environment.name'] = { link = 'Type' },
		['@text.reference'] = { link = 'Constant' }, -- For footnotes, text references, citations.
		['@text.todo'] = { link = 'Todo' },
		['@text.note'] = { link = 'SpecialComment' },
		['@text.warning'] = { link = 'WarningMsg' },
		['@text.danger'] = { link = 'ErrorMsg' },

		['@environment'] = { link = 'Macro' }, -- For text environments of markup languages.
		['@environment.name'] = { link = 'Type' }, -- For the name/the string indicating the type of text environment.

		-- Tags
		['@tag'] = { link = 'Tag' },
		['@tag.attribute'] = { link = '@property' }, -- For html tag attributes.
		['@tag.delimiter'] = { link = 'Delimiter' }, -- Tag delimiter like `<` `>` `/`
		['@strong'] = { fg = c.white, bold = true }, -- For text to be represented with strong.
		['@emphasis'] = { fg = c.white, bold = true }, -- For text to be represented with emphasis.
		['@underline'] = { fg = c.white, underline = true }, -- For text to be represented with an underline.
		['@strike'] = { fg = c.white }, -- For strikethrough text.
		['@title'] = { fg = c.white }, -- Text that is part of a title.
		['@literal'] = { fg = c.white }, -- Literal text.
		['@uri'] = { fg = c.blue }, -- Any URI like a link or email.
		['@math'] = { fg = c.white }, -- For LaTex-like math environments.

		-- Parser: help
		['helpCommand'] = { fg = c.yellow },
	}
end
