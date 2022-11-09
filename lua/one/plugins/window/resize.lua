return {
	'simeji/winresizer',
	desc = 'Resize window layout',

	defaultConfig = {
		{ 'window', 'resize' },
		{ gui_enable = 1, vert = 5, horiz = 3, trigger = '<C-W>r' },
	},

	config = function(config)
		local conf = config.window.resize

		vim.g.winresizer_gui_enable = conf.gui_enable
		vim.g.winresizer_vert_resize = conf.vert
		vim.g.winresizer_horiz_resize = conf.horiz
		vim.g.winresizer_start_key = conf.trigger
	end,
}
