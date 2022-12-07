local colors = { -- basic colors
	black = '#101012',
	grey1 = '#18191B',
	grey2 = '#242629',
	grey3 = '#34373B',
	grey4 = '#474D53',
	grey = '#6B6F80',
	white = '#ABAFB5',
	green = '#00DB1B',
	orange = '#E85500',
	blue = '#589CFF',
	cyan = '#A4CCE3',
	purple = '#7B59E2',
	yellow = '#C7B000',
	red = '#D01A00',

	lightYellow = '#FFFFEB',
	lightGreen = '#C0D78F',
	lightPurple = '#B696DB',

	darkGreen = '#0D2409',
	darkBlue = '#181929',
	darkCyan = '#081821',
	darkRed = '#220708',
	darkYellow = '#212100',
	darkOrange = '#3B1900',
	darkPurple = '#1B0127',
}

local functionsColors = { --
	cursorLine = colors.darkBlue,
	cursorLineNrFG = colors.blue,
	cursorLineNrBG = colors.darkBlue,

	linkFG = '#00B479',
	comment = colors.grey,
	scrollbarBG = '#022954',

	match = { fg = colors.orange },

	diff = {
		add = { bg = colors.darkGreen },
		delete = { fg = colors.red, bg = colors.darkRed },
		change = { bg = colors.darkYellow },
		text = { bg = '#35350C' },
	},
}

for k, v in pairs(functionsColors) do colors[k] = v end

return colors
