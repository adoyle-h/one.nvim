return function(config)
	local c = config.colors

	return {
		TelescopeResultsBorder = { fg = c.white, bg = 'none' },
		TelescopePreviewBorder = { fg = c.white, bg = 'none' },
		TelescopePromptBorder = { fg = c.white, bg = 'none' },
		TelescopeBorder = { fg = c.blue, bg = 'none' },
		TelescopePromptPrefix = { fg = c.blue, bg = 'none' },
		TelescopeSelection = { fg = 'none', bg = c.darkBlue },
		TelescopeSelectionCaret = { fg = c.blue, bg = 'none' },
		TelescopeMatching = { fg = c.match.fg, bg = 'none', underline = true },
	}
end
