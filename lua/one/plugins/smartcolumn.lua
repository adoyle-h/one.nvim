return {
	'm4xshen/smartcolumn.nvim',
	config = function(config)
		require('smartcolumn').setup(config.smartcolumn)
	end,
	defaultConfig = { 'smartcolumn', {
		colorcolumn = '80',
		disabled_filetypes = {
			'alpha', 'calendar', 'help', 'text', 'markdown', 'NvimTree', 'lazy', 'mason', 'help',
			'checkhealth', 'lspinfo', 'noice', 'Trouble', 'fish', 'zsh',
		},
		custom_colorcolumn = {},
		scope = 'file',
		editorconfig = true,
	} },
}
