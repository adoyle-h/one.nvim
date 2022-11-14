local PM = require('one.plugin-manager')

return {
	'j-hui/fidget.nvim',
	desc = 'nvim-lsp loading progress',
	disable = not PM.isPlugDisabled('noice'), -- If noice enabled, disable this plugin.

	highlights = function(config)
		local c = config.colors
		return { FidgetTask = { fg = c.grey } }
	end,

	config = function(config)
		require('fidget').setup(config['lsp-fidget'])
	end,

	defaultConfig = { { 'lsp-fidget' }, {} },
}
