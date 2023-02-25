return function(config)
	local c = config.colors

	return {
		TelescopeNormal = { fg = c.white, bg = c.floatWinBG },
		TelescopeBorder = { fg = c.blue, bg = c.floatWinBG },
		TelescopePromptPrefix = { link = 'TelescopeBorder' },
		TelescopeSelection = { link = 'PmenuSel' },
		TelescopeSelectionCaret = { fg = c.blue, bg = 'none' },
		TelescopeMatching = { fg = c.match.fg, bg = 'none', underline = true },
	}
end
