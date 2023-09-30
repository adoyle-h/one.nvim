local M = {
	'folke/flash.nvim',

	config = function(config)
		require('flash').setup(config.move.flash)
	end,
}

M.highlights = function(config)
	local c = config.colors
	return {
		FlashCurrent = { link = 'Search' },
		FlashMatch = { fg = c.orange, bg = c.black },
		FlashBackdrop = { fg = c.grey, bg = c.black },
		FlashLabel = { fg = c.black, bg = c.orange, bold = true, italic = true },
		FlashChar1 = { fg = c.orange, bg = c.black, bold = true },
		FlashChar2 = { fg = '#a23e03', bg = c.black },
	}
end

M.defaultConfig = {
	{ 'move', 'flash' },

	{
		labels = 'asdfghjklqwertyuiop12345zxcvbnm67890',

		search = {
			-- search/jump in all windows
			multi_window = false,
			-- search direction
			forward = true,
			-- when `false`, find only matches in the given direction
			wrap = true,

			---@type Flash.Pattern.Mode
			-- Each mode will take ignorecase and smartcase into account.
			-- * exact: exact match
			-- * search: regular search
			-- * fuzzy: fuzzy search
			-- * fun(str): custom function that returns a pattern
			--   For example, to only match at the beginning of a word:
			--   mode = function(str)
			--     return "\\<" .. str
			--   end,
			mode = 'exact',

			-- behave like `incsearch`
			incremental = false,

			-- Excluded filetypes and custom window filters
			---@type (string|fun(win:window))[]
			exclude = {
				'notify',
				'cmp_menu',
				'noice',
				'flash_prompt',
				function(win)
					-- exclude non-focusable windows
					return not vim.api.nvim_win_get_config(win).focusable
				end,
			},
			-- Optional trigger character that needs to be typed before
			-- a jump label can be used. It's NOT recommended to set this,
			-- unless you know what you're doing
			trigger = '',
			-- max pattern length. If the pattern length is equal to this
			-- labels will no longer be skipped. When it exceeds this length
			-- it will either end in a jump or terminate the search
			max_length = false, ---@type number|false
		},

		jump = {
			-- save location in the jumplist
			jumplist = true,
			-- jump position
			pos = 'start', ---@type "start" | "end" | "range"
			-- add pattern to search history
			history = false,
			-- add pattern to search register
			register = false,
			-- clear highlight after jump
			nohlsearch = false,
			-- automatically jump when there is only one match
			autojump = false,
			-- You can force inclusive/exclusive jumps by setting the
			-- `inclusive` option. By default it will be automatically
			-- set based on the mode.
			inclusive = nil, ---@type boolean?
			-- jump position offset. Not used for range jumps.
			-- 0: default
			-- 1: when pos == "end" and pos < current position
			offset = nil, ---@type number
		},

		label = {
			-- allow uppercase labels
			uppercase = true,
			-- add any labels with the correct case here, that you want to exclude
			exclude = '',
			-- add a label for the first match in the current window.
			-- you can always jump to the first match with `<CR>`
			current = true,
			-- show the label after the match
			after = true, ---@type boolean|number[]
			-- show the label before the match
			before = false, ---@type boolean|number[]
			-- position of the label extmark
			style = 'overlay', ---@type "eol" | "overlay" | "right_align" | "inline"
			-- flash tries to re-use labels that were already assigned to a position,
			-- when typing more characters. By default only lower-case labels are re-used.
			reuse = 'lowercase', ---@type "lowercase" | "all" | "none"
			-- for the current window, label targets closer to the cursor first
			distance = true,

			-- minimum pattern length to show labels
			-- Ignored for custom labelers.
			min_pattern_length = 0,

			-- Enable this to use rainbow colors to highlight labels
			-- Can be useful for visualizing Treesitter ranges.
			rainbow = {
				enabled = false,
				-- number between 1 and 9
				shade = 5,
			},

			-- With `format`, you can change how the label is rendered.
			-- Should return a list of `[text, highlight]` tuples.
			---@class Flash.Format
			---@field state Flash.State
			---@field match Flash.Match
			---@field hl_group string
			---@field after boolean
			---@type fun(opts:Flash.Format): string[][]
			format = function(opts)
				return { { opts.match.label, opts.hl_group } }
			end,
		},

		highlight = {
			-- show a backdrop with hl FlashBackdrop
			backdrop = true,
			-- Highlight the search matches
			matches = true,
			-- extmark priority
			priority = 5000,
			groups = {
				match = 'FlashMatch',
				current = 'FlashCurrent',
				backdrop = 'FlashBackdrop',
				label = 'FlashLabel',
			},
		},

		-- action to perform when picking a label.
		-- defaults to the jumping logic depending on the mode.
		---@type fun(match:Flash.Match, state:Flash.State)|nil
		action = nil,

		-- initial pattern to use when opening flash
		pattern = '',

		-- When `true`, flash will try to continue the last search
		continue = false,

		-- Set config to a function to dynamically change the config
		config = nil, ---@type fun(opts:Flash.Config)|nil

		-- You can override the default options for a specific mode.
		-- Use it with `require("flash").jump({mode = "forward"})`
		---@type table<string, Flash.Config>
		modes = {
			-- options used when flash is activated through
			-- a regular search with `/` or `?`
			search = {
				-- when `true`, flash will be activated during regular search by default.
				-- You can always toggle when searching with `require("flash").toggle()`
				enabled = false,
				jump = { history = true, register = true, nohlsearch = true },
				search = {
					-- `forward` will be automatically set to the search direction
					-- `mode` is always set to `search`
					-- `incremental` is set to `true` when `incsearch` is enabled
				},
			},

			-- options used when flash is activated through
			-- `f`, `F`, `t`, `T`, `;` and `,` motions
			char = { enabled = false },

			-- options used for treesitter selections
			-- `require("flash").treesitter()`
			treesitter = {
				labels = 'abcdefghijklmnopqrstuvwxyz',
				jump = { pos = 'range' },
				search = { incremental = false },
				label = { before = true, after = true, style = 'inline' },
				highlight = { backdrop = false, matches = false },
			},

			treesitter_search = {
				jump = { pos = 'range' },
				search = { multi_window = true, wrap = true, incremental = false },
				remote_op = { restore = true },
				label = { before = true, after = true, style = 'inline' },
			},

			-- options used for remote flash
			remote = { remote_op = { restore = true, motion = true } },
		},

		-- options for the floating window that shows the prompt,
		-- for regular jumps
		prompt = {
			enabled = true,
			prefix = { { '⚡', 'FlashPromptIcon' } },
			win_config = {
				relative = 'editor',
				width = 1, -- when <=1 it's a percentage of the editor width
				height = 1,
				row = -1, -- when negative it's an offset from the bottom
				col = 0, -- when negative it's an offset from the right
				zindex = 1000,
			},
		},

		-- options for remote operator pending mode
		remote_op = {
			-- restore window views and cursor position
			-- after doing a remote operation
			restore = false,
			-- For `jump.pos = "range"`, this setting is ignored.
			-- `true`: always enter a new motion when doing a remote operation
			-- `false`: use the window's cursor position and jump target
			-- `nil`: act as `true` for remote windows, `false` for the current window
			motion = false,
		},
	},
}

local function charJump(Flash, opts)
	Flash.jump(vim.tbl_deep_extend('force', {
		search = { mode = 'search', forward = opts.forward, wrap = opts.wrap },

		-- max pattern length. If the pattern length is equal to this
		-- labels will no longer be skipped. When it exceeds this length
		-- it will either end in a jump or terminate the search
		max_length = false, ---@type number|false

		label = {
			after = false,
			before = { 0, 0 },
			uppercase = false,
			format = function(opts)
				return { { opts.match.label1, 'FlashChar1' }, { opts.match.label2, 'FlashChar2' } }
			end,
		},
		pattern = [[\<]],

		labeler = function(matches, state)
			local labels = state:labels()
			for m, match in ipairs(matches) do
				match.label1 = labels[math.floor((m - 1) / #labels) + 1]
				match.label2 = labels[(m - 1) % #labels + 1]
				match.label = match.label1
			end
		end,

		-- when first char entered
		action = function(match, state)
			state:hide()

			Flash.jump({
				search = { max_length = 0, forward = opts.forward, wrap = opts.wrap },
				highlight = { matches = false },
				label = {
					format = function(opts)
						return { { opts.match.label2, 'FlashChar1' } }
					end,
				},

				matcher = function(win)
					-- limit matches to the current label
					return vim.tbl_filter(function(m)
						return m.label == match.label and m.win == win
					end, state.results)
				end,

				labeler = function(matches)
					for _, m in ipairs(matches) do
						m.label = m.label2 -- use the second label
					end
				end,
			})
		end,
	}, opts))
end

M.keymaps = {
	{
		'',
		'fw',
		function()
			charJump(require('flash'), { search = { forward = true, wrap = false } })
		end,
		{ desc = 'Jump to the start of word (forward)' },
	},

	{
		'',
		'fb',
		function()
			charJump(require('flash'), { search = { forward = false, wrap = false } })
		end,
		{ desc = 'Jump to the start of word (back forward)' },
	},

	{
		'',
		'fe',
		function()
			charJump(require('flash'), { search = { forward = true, wrap = false }, pattern = '.\\>' })
		end,
		{ desc = 'Jump to the end of word (forward)' },
	},

	{
		'',
		'fE',
		function()
			charJump(require('flash'), { search = { forward = false, wrap = false }, pattern = '.\\>' })
		end,
		{ desc = 'Jump to the end of word (back forward)' },
	},

	{
		'',
		'fl',
		function()
			require('flash').jump({
				search = { mode = 'search', max_length = 0 },
				label = { after = { 0, 0 } },
				highlight = { matches = false },
				pattern = '^\\s*\\S',
			})
		end,
		{ desc = 'Jump to line (skip whitespace and empty line)' },
	},

	{
		'',
		'fL',
		function()
			require('flash').jump({
				search = { mode = 'search', max_length = 0 },
				label = { after = { 0, 0 } },
				pattern = '^\\s*\\S\\?',
			})
		end,
		{ desc = 'Jump to line (include whitespace)' },
	},

	{
		'',
		'fa',
		function()
			require('flash').jump({
				search = {
					mode = function(str)
						return '\\<' .. str
					end,
				},
			})
		end,
		{ desc = 'Jump to word matches beginning of input' },
	},

	{
		'',
		'fA',
		function()
			require('flash').jump({
				search = {
					mode = function(str)
						return str .. '\\>'
					end,
				},
			})
		end,
		{ desc = 'Jump to word matches ending of input' },
	},

	{
		'',
		'f/',
		function()
			require('flash').jump();
		end,
		{ desc = 'Jump to word as you type' },
	},
}

M.commands = {
	FlashTreesitter = function()
		require('flash').treesitter()
	end,

	FlashTreesitterSearch = function()
		require('flash').treesitter_search()
	end,
}

return M
