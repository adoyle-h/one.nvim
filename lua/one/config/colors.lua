local colors = { -- basic colors
	black = '#101012', -- #101012
	grey1 = '#18191B', -- #18191B
	grey2 = '#242629', -- #242629
	grey3 = '#34373B', -- #33373B
	grey4 = '#484D52', -- #474D53
	grey = '#6C6F7F', -- #6B6F80
	white = '#ACAFB4', -- #ABAFB5
	green = '#75C44E', -- #00DB1B
	orange = '#D75F00', -- #E85500
	blue = '#689AFD', -- #589CFF
	cyan = '#ACCBE1', -- #A4CCE3
	purple = '#765ADA', -- #7B59E2 '#574AB2',
	yellow = '#C3B11A', -- #C7B000 '#E3D888' '#FFE787' '#D1D0A3'
	red = '#BF3100', -- #D01C00

	lightYellow = '#FFFFED', -- #FFFFEB
	lightGreen = '#C4D697', -- #C0D78F
	lightPurple = '#B197D6', -- #B696DB

	darkGreen = '#13230c', -- #0D2409
	darkBlue = '#181928', -- #181929
	darkCyan = '#0c1820', -- #081821
	darkRed = '#1F0909', -- #220708 '#340009'
	darkYellow = '#212100', -- #212100
	darkOrange = '#371B00', -- #3B1900
	darkPurple = '#180225', -- #1B0127
}

local functionsColors = { --
	cursorLine = colors.darkBlue,
	cursorLineNrFG = colors.blue,
	cursorLineNrBG = colors.darkBlue,

	linkFG = '#30B17D', -- #00B479
	comment = colors.grey,
	scrollbarBG = '#0E2851', -- #022954

	match = { fg = colors.orange },

	diff = {
		add = { bg = colors.darkGreen },
		delete = { fg = colors.red, bg = colors.darkRed },
		change = { bg = colors.darkYellow },
		text = { bg = '#353513' }, -- #35350C
	},
}

for k, v in pairs(functionsColors) do colors[k] = v end

return colors
