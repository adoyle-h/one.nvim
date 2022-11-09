local M = {
	'onedarkpro',

	requires = { 'olimorris/onedarkpro.nvim' },

	config = function(config)
		require('onedarkpro').setup(config.onedarkpro)
		vim.cmd('colorscheme onedarkpro')
	end,
}

M.defaultConfig = function(config)
	local c = config.colors;

	return {
		'onedarkpro',
		{
			-- Options see https://github.com/olimorris/onedarkpro.nvim#wrench-configuration
			theme = 'onedark', -- 'onelight', 'onedark_vivid', 'onedark_dark'

			caching = false, -- Use caching for the theme?

			colors = { -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
				bg = c.black,
				fg = c.white,
				red = c.red,
				orange = c.orange,
				yellow = c.yellow,
				green = c.green,
				cyan = c.cyan,
				blue = c.blue,
				purple = c.purple,
				white = c.white,
				black = c.black,
				gray = c.grey,
				highlight = c.yellow,

				cursorline = c.cursorLine,
				comment = c.comment,
				selection = c.darkOrange,

				diff_add = c.diff.add.bg,
				diff_delete = c.diff.delete.bg,
				diff_change = c.diff.change.bg,
				diff_text = c.diff.text.bg,
			},

			-- Only fix onedarkpro highlights. Do not put all highlights here
			highlights = { -- Override default highlight groups.
				StatusLine = { bg = 'NONE', fg = 'NONE' }, -- Fix caret in statusline. https://github.com/nvim-lualine/lualine.nvim/discussions/866
				CursorLineNr = { bg = c.cursorLineNrBG, fg = c.cursorLineNrFG, style = 'bold' },

				-- override diff styles
				DiffAdd = { bg = c.diff.add.bg },
				DiffDelete = { fg = c.diff.delete.fg, bg = c.diff.delete.bg },
				DiffChange = { bg = c.diff.change.bg, style = 'nocombine' },
				DiffText = { bg = c.diff.text.bg, style = 'nocombine' },
			},

			-- https://github.com/olimorris/onedarkpro.nvim#configuring-filetypes
			filetypes = { all = false },

			plugins = { -- Override which plugins highlight groups are loaded
				-- All plugins list in https://github.com/olimorris/onedarkpro.nvim#electric_plug-supported-plugins
				all = false,
				native_lsp = true,
				nvim_notify = true,
				neo_tree = true,
				nvim_cmp = true,
				treesitter = false, -- NOTE: Do not enable this
				trouble = true,
				-- nvim_ts_rainbow = true,
			},

			styles = {
				strings = 'NONE', -- Style that is applied to strings
				comments = 'italic', -- Style that is applied to comments
				keywords = 'NONE', -- Style that is applied to keywords
				functions = 'NONE', -- Style that is applied to functions
				variables = 'NONE', -- Style that is applied to variables
				virtual_text = 'NONE', -- Style that is applied to virtual text
			},

			options = {
				bold = true, -- Use the themes opinionated bold styles?
				italic = true, -- Use the themes opinionated italic styles?
				underline = true, -- Use the themes opinionated underline styles?
				undercurl = true, -- Use the themes opinionated undercurl styles?
				cursorline = true, -- Use cursorline highlighting?
				transparency = false, -- Use a transparent background?
				terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
				window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
			},
		},
	}
end

return M
