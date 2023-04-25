return {
	'jcdickinson/codeium.nvim',
	id = 'cmp-codeium',

	disable = true,

	defaultConfig = {
		'cmp-codeium',
		-- https://github.com/jcdickinson/codeium.nvim#options
		{
			-- config_path = '', bin_path = '', api = { host = '', port = '' }, tools = {}, wrapper = ''
		},
	},

	config = function(config)
		require('codeium').setup(config)
	end,
}
