return {
	'smjonas/live-command.nvim',

	config = function(config)
		require('live-command').setup(config['live-cmd'])
	end,

	defaultConfig = {
		'live-cmd',
		{
			command_name = 'Preview',
			enable_highlighting = true,
			inline_highlighting = true,
			hl_groups = {
				insertion = 'DiffAdd',
				deletion = 'DiffDelete',
				change = 'DiffChange',
			},

			commands = {
				Norm = { cmd = 'norm' },
			},
		},
	},
}
