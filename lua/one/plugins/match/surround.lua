return {
	'kylechui/nvim-surround',
	desc = 'mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, tags etc.',
	config = function(config)
		require('nvim-surround').setup(config.surround)
	end,

	defaultConfig = { 'surround', {} },
}
