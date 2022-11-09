return {
	'ziontee113/icon-picker.nvim',

	config = function(config)
		require('icon-picker').setup(config['icon-picker'])
	end,

	defaultConfig = { 'icon-picker', {} },
}
