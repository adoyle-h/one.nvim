return {
	'rainbowhxch/accelerated-jk.nvim',
	desc = 'accelerates j/k movement steps while j or k key is repeating',

	config = function(config)
		require('accelerated-jk').setup(config.move.accelerated)
	end,

	defaultConfig = {
		{ 'move', 'accelerated' },
		{ -- :h accelerated-jk
			mode = 'time_driven',
			enable_deceleration = false,
			acceleration_limit = 500,
			acceleration_table = { 10, 14, 20, 30 },
		},
	},

	keymaps = {
		{ 'n', 'j', '<Plug>(accelerated_jk_gj)', { desc = 'move cursor down' } },
		{ 'n', 'k', '<Plug>(accelerated_jk_gk)', { desc = 'move cursor up' } },
	},
}
