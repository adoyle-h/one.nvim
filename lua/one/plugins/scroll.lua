return {
	'karb94/neoscroll.nvim',
	desc = 'Smooth scrolling',
	config = function(config)
		require('neoscroll').setup(config.scroll)
		require('neoscroll.config').set_mappings(config.scroll.mappings)
	end,

	defaultConfig = {
		'scroll',
		{
			-- All these keys will be mapped to their corresponding default scrolling animation
			-- mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
			mappings = {
				-- Syntax: t[keys] = {function, {function arguments}}
				-- Use the "sine" easing function
				['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '100', [['quadratic']] } },
				['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '100', [['quadratic']] } },
				-- Use the "circular" easing function
				['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '120', [['quadratic']] } },
				['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '120', [['quadratic']] } },
				-- Pass "nil" to disable the easing animation (constant scrolling speed)
				['<C-y>'] = { 'scroll', { '-0.10', 'true', '100', nil } },
				['<C-e>'] = { 'scroll', { '0.10', 'true', '100', nil } },
				-- When no easing function is provided the default easing function (in this case "quadratic") will be used
				['zt'] = { 'zt', { '200' } },
				['zz'] = { 'zz', { '200' } },
				['zb'] = { 'zb', { '200' } },
				-- ['G'] = { 'G', { '50', [['sine']] } }, -- @BUG ":<number>G" will not work.
				-- ['gg'] = { 'gg', { '50', [['sine']] } }, -- Too slow when scroll large content
			},

			hide_cursor = true, -- Hide cursor while scrolling
			stop_eof = false, -- Stop at <EOF> when scrolling downwards
			respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
			cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
			easing_function = 'quadratic', -- Default easing function. Values: quadratic, cubic, quartic, quintic, circular, sine
			pre_hook = nil, -- Function to run before the scrolling animation starts
			post_hook = nil, -- Function to run after the scrolling animation ends
			performance_mode = false, -- Disable "Performance Mode" on all buffers.
		},
	},
}
