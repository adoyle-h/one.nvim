return {
	'theme',

	config = function(config)
		local conf = config.theme
		vim.g.background = conf.background
	end,

	defaultConfig = {
		'theme',
		{
			background = 'dark', -- Dark theme. DO NOT CHANGE THIS OPTION.
			theme = 'onedark',
		},
	},
}
