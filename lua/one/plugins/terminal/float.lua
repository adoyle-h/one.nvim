return {
	'voldikss/vim-floaterm',

	highlights = function(config)
		local c = config.colors
		return { --
			Floaterm = {},
			FloatermBorder = { fg = c.purple },
		}
	end,

	config = function(config)
		for key, value in pairs(config.floaterm) do vim.g['floaterm_' .. key] = value end
	end,

	defaultConfig = {
		'floaterm',
		{
			shell = vim.o.shell,
			title = 'FloatTerm($1/$2)',
			width = 0.6,
			height = 0.6,
			wintype = 'float',
			autoclose = 1,
			autoinsert = true,
			autohide = 1,
			-- 'top', 'bottom', 'left', 'right', 'topleft', 'topright', 'bottomleft',
			-- 'bottomright', 'center', 'auto'(at the cursor place). Default: 'center'
			position = 'topright',
			borderchars = '─│─│┌┐┘└',
			rootmarkers = { '.project', '.git', '.hg', '.svn', '.root' },
			opener = 'split',
			giteditor = true,
		},
	},

}
