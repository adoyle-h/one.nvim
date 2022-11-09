return {
	'phaazon/hop.nvim',
	branch = 'v2',

	highlights = function(config)
		local c = config.colors
		return {
			HopNextKey = { fg = c.green, bg = c.black, bold = true },
			HopNextKey1 = { fg = '#00dfff', bg = c.black, bold = true },
			HopNextKey2 = { fg = '#2b8db3', bg = c.black },
		}
	end,

	config = function(config)
		require('hop').setup(config.move.jump)
	end,

	defaultConfig = {
		{ 'move', 'jump' },
		{
			keys = 'asdghklqwertyuiopzxcvbnmfj',
			quit_key = '<Esc>',
			multi_windows = false,
			create_hl_autocmd = false,
		},
	},

	keymaps = function()
		-- local HintDirection = require('hop.hint').HintDirection
		local hop = require('hop')
		local HintPosition = require('hop.hint').HintPosition
		local HintDirection = require('hop.hint').HintDirection
		local function genChar(char)
			return function()
				hop.hint_patterns({}, char)
			end
		end

		local keymaps = {
			{
				'',
				'fw',
				function()
					hop.hint_words { direction = HintDirection.AFTER_CURSOR }
				end,
				{ desc = 'cursor jumps to the start of word' },
			},

			{
				'',
				'fb',
				function()
					hop.hint_words { direction = HintDirection.BEFORE_CURSOR }
				end,
				{ desc = 'cursor jumps to char which user type' },
			},

			{
				'',
				'fe',
				function()
					hop.hint_words { hint_position = HintPosition.END }
				end,
				{ desc = 'cursor jumps to the end of word' },
			},

			{ '', 'fc', hop.hint_char1, { desc = 'cursor jumps to char which user type' } },
			{ '', 'f1', hop.hint_char1, { desc = 'cursor jumps to char which user type' } },
			{ '', 'f2', hop.hint_char2, { desc = 'cursor jumps to chars prefixed which user type' } },
			{ '', 'fl', hop.hint_lines, { desc = 'cursor jumps to line (skip whitespace)' } },
			{
				'',
				'fL',
				hop.hint_lines_skip_whitespace,
				{ desc = 'cursor jumps to line (include whitespace)' },
			},
		}

		for _, i in pairs {
			-- LuaFormatter off
			',', '.', '/', '\\', '?', ';', ':', '\'', '"', '(', ')', '[', ']', '{', '}',
			'~','!', '@', '#', '$', '%', '^', '&', '*', '-', '_', '+', '=',
			-- LuaFormatter on
		} do keymaps[#keymaps + 1] = { '', 'f' .. i, genChar(i), { desc = 'cursor jumps to ' .. i } } end

		return keymaps
	end,
}
