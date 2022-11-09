-- null-ls is an attempt to bridge that gap and simplify the process of creating,
-- sharing, and setting up LSP sources using pure Lua.
local M = { 'jose-elias-alvarez/null-ls.nvim', requires = { 'jayp0521/mason-null-ls.nvim' } }

local config = require('one.config').config
local util = require('one.util')

M.defaultConfig = {
	'nullLS',
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/CONFIG.md#options
	{
		debug = false,
		debounce = 150,
		default_timeout = 3000,

		-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/CONFIG.md#diagnostics_format-string
		diagnostics_format = '[#{c}] #{m}',

		-- should_attach = function(bufnr)
		--   return not vim.api.nvim_buf_get_name(bufnr):match('^gitsigns://')
		-- end,

		-- Available null-ls sources list
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
		-- How to config null-ls sources:
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
		sources = function(builtins)
			return { builtins.completion.spell }
		end,

		automatic_installation = false,
	},
}

function M.config()
	local nullLS = require('null-ls')
	local conf = config.nullLS

	local sources = conf.sources
	if type(sources) == 'function' then sources = sources(nullLS.builtins) end
	sources = sources or {}

	if pcall(require, 'gitsigns') then table.insert(sources, nullLS.builtins.code_actions.gitsigns) end

	local lspFormat = require('lsp-format')

	-- print(vim.inspect(sources))

	local opts = util.merge(conf, {
		sources = sources,
		on_attach = function(client, bufnr)
			if client.supports_method('textDocument/formatting') then
				-- If null-ls client is a formatter, register the client to lsp-format.
				-- So we can use lsp-format to trigger null-ls formatter when execute ":w".
				lspFormat.on_attach(client, bufnr)
			end
		end,
	})

	nullLS.setup(opts)

	require('mason-null-ls').setup { automatic_installation = conf.automatic_installation }
end

M.autocmds = {
	User = {
		pattern = 'MasonNullLsUpdateCompleted',
		callback = function()
			vim.schedule(function()
				print 'mason-null-ls has finished'
			end)
		end,
	},
}

M.filetypes = {
	['null-ls-info'] = function()
		vim.api.nvim_win_set_config(0, { border = 'rounded', height = 30 })
	end,
}

return M
