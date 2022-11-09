local M = {
	'tzachar/cmp-tabnine',
	run = './install.sh',
	disable = true,

	config = function(config)
		require('cmp_tabnine.config'):setup(config.tabnine)
	end,

	defaultConfig = {
		'tabnine',
		{
			max_lines = 1000,
			max_num_results = 20,
			sort = true,
			run_on_every_keystroke = true,
			snippet_placeholder = '..',
			ignored_file_types = { -- default is not to ignore
				-- uncomment to ignore in lua:
				-- lua = true
			},
			show_prediction_strength = true,
		},
	},
}

return M
