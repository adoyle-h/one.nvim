return {
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions

	{ 'n', '<M-m>', ':Mason<CR>', { silent = true } },

	{ 'n', '[d', vim.diagnostic.goto_prev, { silent = true, desc = ':h vim.diagnostic.goto_prev' } },

	{ 'n', ']d', vim.diagnostic.goto_next, { silent = true, desc = ':h vim.diagnostic.goto_next' } },

	-- See `:help vim.lsp.*` for documentation on any of the below functions

	{ 'n', '<leader>r', vim.lsp.buf.rename, { silent = true, desc = ':h vim.lsp.buf.rename' } },

	{ 'n', 'gc', vim.lsp.buf.code_action, { silent = true, desc = ':h vim.lsp.buf.code_action' } },

	{ 'n', 'gh', vim.lsp.buf.hover, { silent = true, desc = ':h vim.lsp.buf.hover' } },

	{ 'n', 'gs', vim.lsp.buf.signature_help, { silent = true, desc = ':h vim.lsp.buf.signature_help' } },
}
