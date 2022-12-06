return {
	-- 'lukas-reineke/lsp-format.nvim',
	'adoyle-h/lsp-format.nvim',
	branch = 'a',

	defaultConfig = {
		{ 'lsp', 'format' },
		{
			-- ['null-ls'] = {
			--   sync = true
			-- },

			-- ":h lspconfig-all" for LSP configs provided by nvim-lspconfig
			javascript = {
				-- order: (table|nil) List of client names. Formatting is requested from clients
				-- in the following order: first all clients that are not in the order list,
				-- then the remaining clients in the order as they occur in the order list.
				-- Use :LspInfo to see the clients.
				order = { 'null-ls', 'eslint', 'prettier' },
			},
		},
	},

	config = function()
		local config = require('one.config').config
		local lspFormat = require('lsp-format')
		lspFormat.setup(config.lsp.format)
	end,

	keymaps = { --
		{
			'n',
			'<M-=>',
			function()
				require('lsp-format').format {}
			end,
			{ silent = true, desc = 'Format code' },
		},

		{
			'v',
			'<M-=>',
			-- formatInRange use make_given_range_params which has bug. Add <ESC> for workaround.
			-- See https://github.com/neovim/neovim/issues/15905
			'<ESC>:lua require("lsp-format").format_in_range()<CR>',
			{ silent = true, desc = 'Format code in selection' },
		},
	},

	autocmds = {
		LspAttach = {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				require('lsp-format').on_attach(client, args.buf)
			end,
		},
	},
}
