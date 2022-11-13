local config = require('one.config').config
local colors = config.colors

local Twilight = {
	'folke/twilight.nvim',

	defaultConfig = {
		{ 'zen', 'twilight' },
		{
			dimming = {
				alpha = 0.25, -- amount of dimming
				-- we try to get the foreground from the highlight groups or fallback color
				color = { 'Normal', colors.white },
				term_bg = colors.black, -- if guibg=NONE, this will be used to calculate text color
				inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
			},

			context = 10, -- amount of lines we will try to show around the current line
			treesitter = true, -- use treesitter when available for the filetype

			-- treesitter is used to automatically expand the visible text,
			-- but you can further control the types of nodes that should always be fully expanded
			expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
				'function',
				'method',
				'table',
				'if_statement',
			},

			exclude = {}, -- exclude these filetypes
		},
	},

	config = function()
		require('twilight').setup(config.zen.twilight)
	end,
}

local ZenMode = {
	'folke/zen-mode.nvim',

	config = function()
		require('zen-mode').setup(config.zen.mode)
	end,

	keymaps = { { 'n', '<space>z', ':ZenMode<CR>' } },

	defaultConfig = {
		{ 'zen', 'mode' },
		{
			window = {
				backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
				-- height and width can be:
				-- * an absolute number of cells when > 1
				-- * a percentage of the width / height of the editor when <= 1
				-- * a function that returns the width or the height
				width = 101, -- width of the Zen window
				height = 1, -- height of the Zen window
				-- by default, no options are changed for the Zen window
				-- uncomment any of the options below, or add other vim.wo options you want to apply
				options = {
					signcolumn = 'no', -- disable signcolumn
					number = false, -- disable number column
					relativenumber = false, -- disable relative numbers
					-- cursorline = false, -- disable cursorline
					cursorcolumn = false, -- disable cursor column
					foldcolumn = '0', -- disable fold column
					-- list = false, -- disable whitespace characters
				},
			},

			plugins = {
				-- disable some global vim options (vim.o...)
				-- comment the lines to not apply the options
				options = {
					enabled = true,
					ruler = false, -- disables the ruler text in the cmd line area
					showcmd = false, -- disables the command in the last line of the screen
				},
				twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
				gitsigns = { enabled = false }, -- disables git signs
				tmux = { enabled = false }, -- disables the tmux statusline
				-- this will change the font size on kitty when in zen mode
				-- to make this work, you need to set the following kitty options:
				-- - allow_remote_control socket-only
				-- - listen_on unix:/tmp/kitty
				kitty = {
					enabled = false,
					font = '+4', -- font size increment
				},
			},

			-- callback where you can add custom code when the Zen window opens
			on_open = function(win)
				vim.wo.cc = false
				vim.wo.winbar = ''
			end,

			-- callback where you can add custom code when the Zen window closes
			on_close = function()
			end,
		},
	},
}

return { --
	'zen',
	desc = 'For better writing experience',
	requires = { Twilight, ZenMode },
}
