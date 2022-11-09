return function(config)
	local c = config.colors
	local grey = c.grey

	return {
		-- Use :TSHighlightCapturesUnderCursor to query highlight group name
		htmlArg = { fg = c.cyan },
		htmlBold = { fg = c.orange, bold = true },
		htmlItalic = { fg = c.purple, italic = true },
		htmlLink = { fg = c.green, underline = true },
		htmlH1 = { fg = c.blue, bold = true },
		htmlH2 = { link = 'htmlH1' },
		htmlH3 = { link = 'htmlH1' },
		htmlH4 = { link = 'htmlH1' },
		htmlH5 = { link = 'htmlH1' },
		htmlH6 = { link = 'htmlH1' },
		htmlSpecialChar = { link = 'SpecialChar' },
		htmlSpecialTagName = { fg = c.red },
		htmlTag = { fg = c.blue },
		htmlEndTag = { link = 'htmlTag' },
		htmlTagN = { fg = c.blue },
		htmlTagName = { fg = c.blue },
		htmlTitle = { fg = c.fg },
		htmlString = { fg = c.orange },

		mkdURL = { fg = c.green },
		mkdLink = { fg = c.linkFG, underline = true },
		mkdLinkDef = { fg = c.linkFG },
		mkdListItem = { fg = grey },
		mkdCode = { fg = '#6D78BC' },
		mkdCodeDelimiter = { link = 'mkdCode' },
		mkdCodeStart = { link = 'Comment' },
		mkdCodeEnd = { link = 'Comment' },

		luaFunc = { link = 'Function' },
		luaParen = { link = '@field' },
	}
end
