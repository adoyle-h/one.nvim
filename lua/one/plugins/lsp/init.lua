return {
	'lsp',

	requires = { require('one.plugins.lsp.main') },

	deps = {
		require('one.plugins.lsp.mason'),
		require('one.plugins.lsp.mason-installer'),
		'williamboman/mason-lspconfig.nvim',
		require('one.plugins.lsp.null-ls'),
		require('one.plugins.lsp.preview'),
		require('one.plugins.lsp.nlsp'),
		require('one.plugins.lsp.fidget'),
		require('one.plugins.lsp.format'),

		{
			'adoyle-h/lsp-toggle.nvim',
			config = function(config)
				require('lsp-toggle').setup(config.lsp.toggle)
			end,
			defaultConfig = { { 'lsp', 'toggle' }, {} },
		},

		{
			-- This plugin is not needed after https://github.com/neovim/neovim/pull/20198
			'antoinemadec/FixCursorHold.nvim',
			config = function()
				vim.g.cursorhold_updatetime = 100
			end,
		},
	},
}
