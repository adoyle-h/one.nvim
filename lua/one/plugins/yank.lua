return {
	'gbprod/yanky.nvim',

	config = function(config)
		require('yanky').setup(config.yank)
		require('telescope').load_extension('yank_history')
	end,

	defaultConfig = {
		'yank',
		{
			ring = {
				history_length = 100,
				storage = 'shada',
				sync_with_numbered_registers = true,
				cancel_event = 'update',
			},
			picker = {
				select = {
					action = nil, -- nil to use default put action
				},
				telescope = {
					mappings = nil, -- nil to use default mappings
				},
			},
			system_clipboard = { sync_with_ring = false },
			highlight = { on_put = true, on_yank = true, timer = 500 },
			preserve_cursor_position = { enabled = true },
		},
	},

	keymaps = {
		{ { 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)' },
		{ { 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)' },
		{ { 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)' },
		{ { 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)' },
	},
}
