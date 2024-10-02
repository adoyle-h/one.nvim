local function setKeymaps(neoscroll, mappings)
	local modes = { 'n', 'v', 'x' }
	for key, func in pairs(mappings) do
		vim.keymap.set(modes, key, function()
			func(neoscroll)
		end)
	end
end

return {
	'karb94/neoscroll.nvim',
	desc = 'Smooth scrolling',
	config = function(config)
		local neoscroll = require('neoscroll')
		neoscroll.setup(config.scroll)
		setKeymaps(neoscroll, config.scroll.mappings)
	end,

	defaultConfig = {
		'scroll',
		{
			mappings = {
				-- :h neoscroll-helper-functions
				-- 'quadratic'
				['<C-u>'] = function(neoscroll) neoscroll.ctrl_u({ duration = 100 }) end;
				['<C-d>'] = function(neoscroll) neoscroll.ctrl_d({ duration = 100 }) end;
				['<C-b>'] = function(neoscroll) neoscroll.ctrl_b({ duration = 120 }) end;
				['<C-f>'] = function(neoscroll) neoscroll.ctrl_f({ duration = 120 }) end;
				['<C-y>'] = function(neoscroll) neoscroll.scroll(-0.1, { move_cursor = false; duration = 100 }) end;
				['<C-e>'] = function(neoscroll) neoscroll.scroll(0.1, { move_cursor = false; duration = 100 }) end;
				['zt'] = function(neoscroll) neoscroll.zt({ half_win_duration = 200 }) end;
				['zz'] = function(neoscroll) neoscroll.zz({ half_win_duration = 200 }) end;
				['zb'] = function(neoscroll) neoscroll.zb({ half_win_duration = 200 }) end;
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
