local M = {
	'folke/tokyonight.nvim',
	config = function(config)
		require('tokyonight').setup(config.tokyonight)
		vim.cmd.colorscheme 'tokyonight'
	end,
}

local config = require('one.config').config
local c = config.colors

M.defaultConfig = {
	'tokyonight',
	{
		-- your configuration comes here
		-- or leave it empty to use the default settings
		style = 'night', -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
		light_style = 'day', -- The theme is used when the background is set to light
		transparent = false, -- Enable this to disable setting the background color
		terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
		styles = {
			-- Style to be applied to different syntax groups
			-- Value is any valid attr-list value for `:help nvim_set_hl`
			comments = { italic = false },
			keywords = { italic = true },
			functions = {},
			variables = {},
			-- Background styles. Can be "dark", "transparent" or "normal"
			sidebars = 'dark', -- style for sidebars, see below
			floats = 'dark', -- style for floating windows
		},
		sidebars = { 'qf', 'help' }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
		day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
		hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
		dim_inactive = true, -- dims inactive windows
		lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

		--- You can override specific color groups to use other groups or a hex color
		--- function will be called with a ColorScheme table
		---@param colors ColorScheme
		on_colors = function(colors)
			return vim.tbl_extend('force', colors, {
				none = 'NONE',
				bg_dark = c.black,
				bg = c.black,
				bg_float = c.black, -- '#16161e',
				bg_highlight = c.black, -- '#292e42',
				bg_popup = c.black, -- '#16161e',
				bg_search = c.black, -- '#3d59a1',
				bg_sidebar = c.black, -- '#16161e',
				bg_statusline = c.black, -- '#16161e',
				bg_visual = c.black, -- '#33467c',
				black = c.black,
				blue = c.blue,
				blue0 = '#3d59a1',
				blue1 = '#2ac3de',
				blue2 = '#0db9d7',
				blue5 = '#89ddff',
				blue6 = '#b4f9f8',
				blue7 = '#394b70',
				border = c.blue,
				border_highlight = '#7aa2f7',
				comment = '#565f89',
				cyan = c.cyan,
				dark3 = c.black, -- '#545c7e',
				dark5 = c.black, -- '#737aa2',
				diff = { add = c.diff.add, change = c.diff.change, delete = c.diff.delete, text = c.diff.text },
				error = c.red,
				fg = c.white,
				fg_dark = '#a9b1d6',
				fg_float = '#c0caf5',
				fg_gutter = '#3b4261',
				fg_sidebar = '#a9b1d6',
				git = { change = c.git.change, add = c.git.add, delete = c.git.delete, ignore = '#545c7e' },
				gitSigns = { change = c.git.change, add = c.git.add, delete = c.git.delete },
				green = c.green,
				green1 = '#9ece6a',
				green2 = '#41a6b5',
				hint = c.green,
				info = c.cyan,
				magenta = '#bb9af7',
				magenta2 = '#ff007c',
				none = 'NONE',
				orange = '#ff9e64',
				purple = c.purple,
				red = c.red,
				red1 = '#db4b4b',
				teal = '#1abc9c',
				terminal_black = '#414868',
				warning = c.yellow,
				yellow = c.yellow,
			})
		end,

		--- You can override specific highlights to use other groups or a hex color
		--- function will be called with a Highlights and ColorScheme table
		---@param highlights Highlights
		---@param colors ColorScheme
		on_highlights = function(highlights, colors)
		end,
	},
}

return M
