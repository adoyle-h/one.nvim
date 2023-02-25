return function(config)
	local c = config.colors
	local white = c.white
	local blue = c.blue
	local yellow = c.yellow

	return {
		CmpItemAbbr = { fg = white },
		CmpItemAbbrDeprecated = { fg = white },
		CmpItemAbbrMatch = { fg = blue },
		CmpItemAbbrMatchFuzzy = { fg = blue },
		CmpItemMenu = { fg = c.grey3 },

		CmpItemKindText = { fg = c.orange },
		CmpItemKindMethod = { fg = blue },
		CmpItemKindFunction = { link = 'CmpItemKindMethod' },
		CmpItemKindConstructor = { fg = yellow },
		CmpItemKindField = { fg = blue },
		CmpItemKindClass = { fg = yellow },
		CmpItemKindInterface = { link = 'CmpItemKindClass' },
		CmpItemKindModule = { fg = blue },
		CmpItemKindProperty = { fg = blue },
		CmpItemKindValue = { fg = c.orange },
		CmpItemKindEnum = { fg = yellow },
		CmpItemKindKeyword = { fg = c.purple },
		CmpItemKindSnippet = { fg = c.green },
		CmpItemKindFile = { fg = blue },
		CmpItemKindEnumMember = { fg = c.cyan },
		CmpItemKindConstant = { fg = c.green },
		CmpItemKindStruct = { fg = yellow },
		CmpItemKindTypeParameter = { fg = yellow },

		CmpNormal = { link = 'Pmenu' },
		CmpCursorLine = { link = 'PmenuSel' },
		CmpFloatBorder = { fg = c.blue, bg = c.floatWinBG },
	}
end
