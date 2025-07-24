local symbolMap = require('one.config').config.symbolMap

local M = { 'neovim/nvim-lspconfig' }

local SeverityMap = {
	[vim.diagnostic.severity.ERROR] = symbolMap.ERROR,
	[vim.diagnostic.severity.WARN] = symbolMap.WARN,
	[vim.diagnostic.severity.INFO] = symbolMap.INFO,
	[vim.diagnostic.severity.HINT] = symbolMap.HINT,
}

M.highlights = function(config)
	local c = config.colors
	return {
		LspWindowBorder = { fg = c.cyan },
		LspInfoTitle = { fg = c.lightGreen }, -- Client name
		LspInfoList = { fg = c.lightGreen }, -- Server name list
		LspInfoFiletype = { fg = c.purple }, -- `filetypes` area
		LspInfoTip = { link = 'Comment' }, -- Tip
		LspInfoBorder = { fg = c.blue }, -- Window border

		DiagnosticUnnecessary = { fg = c.grey, undercurl = true },

		DiagnosticError = { fg = c.red },
		DiagnosticWarn = { fg = c.yellow },
		DiagnosticInfo = { fg = c.blue },
		DiagnosticHint = { fg = c.cyan },
		DiagnosticOk = { fg = c.lightGreen },

		DiagnosticSignError = { fg = c.red },
		DiagnosticSignWarn = { fg = c.yellow },
		DiagnosticSignInfo = { fg = c.blue },
		DiagnosticSignHint = { fg = c.cyan },
		DiagnosticSignOk = { fg = c.lightGreen },

		DiagnosticUnderlineError = { fg = c.red, undercurl = true },
		DiagnosticUnderlineWarn = { fg = c.yellow, undercurl = true },
		DiagnosticUnderlineInfo = { fg = c.blue, undercurl = true },
		DiagnosticUnderlineHint = { fg = c.cyan, undercurl = true },
		DiagnosticUnderlineOk = { fg = c.lightGreen, undercurl = true },
	}
end

M.defaultConfig = {
	'lsp',
	{
		log = { level = 'WARN' }, -- 'TRACE', 'DEBUG', 'INFO', 'WARN', 'ERROR', 'OFF'

		masonLspconfig = {
			automatic_enable = true,
		},

		cursorHoldUptime = 100, -- millisecond. see ":h updatetime"

		-- Change lsp.setup(opts). Format: {['lsp_name'] = settings}
		-- ":h lspconfig-all" or https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
		-- for LSP configs provided by nvim-lspconfig
		setup = {

			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
			tsserver = {
				filetypes = { -- limit tsserver only .ts files
					'typescript',
					'typescriptreact',
					'typescript.tsx',
				},
			},

			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd
			clangd = {
				cmd = { 'clangd', '--enable-config' }, -- allow .clangd file
				-- Fix: multiple different client offset_encodings detected for buffer
				-- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428#issuecomment-997226723
				capabilities = { offsetEncoding = { 'utf-16' } },
			},

			-- sumneko_lua = {
			-- 	-- You can write lsp.settings in lua. Or write it to lsp-settings/<lsp_name>.yaml file (See nlsp features).
			-- 	-- If have the same key, the value in the YAML file will take precedence.
			-- 	settings = { Lua = { diagnostics = { globals = {} } } },
			-- },
		},

		diagnostic = { -- :h vim.diagnostic.config
			virtual_text = false,
			signs = {
				text = SeverityMap,
				numhl = {
					[vim.diagnostic.severity.ERROR] = 'DiagnosticSign' .. 'ERROR',
					[vim.diagnostic.severity.WARN] = 'DiagnosticSign' .. 'WARN',
					[vim.diagnostic.severity.INFO] = 'DiagnosticSign' .. 'INFO',
					[vim.diagnostic.severity.HINT] = 'DiagnosticSign' .. 'HINT',
				},
				priority = 10, -- the priority of gitsigns is 6
			},
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				wrap = true,
				max_width = 120,
				max_height = 20,
				focusable = false,
				source = false, -- (boolean or string) Show source in diagnostics. Values: 'always' or 'if_many'
				prefix = ' ',
				scope = 'cursor',
				format = function(d)
					return string.format('%s %s %s: [%s] %s', SeverityMap[d.severity], d.col, d.source, d.code,
						d.message)
				end,

				close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },

				border = { -- See the border property of ":h nvim_open_win"
					{ '╭', 'LspWindowBorder' },
					{ '─', 'LspWindowBorder' },
					{ '╮', 'LspWindowBorder' },
					{ '│', 'LspWindowBorder' },
					{ '╯', 'LspWindowBorder' },
					{ '─', 'LspWindowBorder' },
					{ '╰', 'LspWindowBorder' },
					{ '│', 'LspWindowBorder' },
				},

				-- border = {
				--   { '╔', 'LspWindowBorder' },
				--   { '═', 'LspWindowBorder' },
				--   { '╗', 'LspWindowBorder' },
				--   { '║', 'LspWindowBorder' },
				--   { '╝', 'LspWindowBorder' },
				--   { '═', 'LspWindowBorder' },
				--   { '╚', 'LspWindowBorder' },
				--   { '║', 'LspWindowBorder' },
				-- },
			},
		},
	},
}

-- Since nvim 0.11, it add default keymaps "gr*" for LSP
-- https://github.com/neovim/neovim/pull/28651
-- But I prefer to use gr/gR/gi/gt/gd with rmagatti/goto-preview
local function disableNvimLSPDefaultMapping()
	vim.keymap.del('n', 'grr')
	vim.keymap.del('n', 'grn')
	vim.keymap.del('n', 'gri')
	vim.keymap.del({ 'n', 'x' }, 'gra')
end

function M.config(config)
	local conf = config.lsp

	disableNvimLSPDefaultMapping()

	vim.o.updatetime = conf.cursorHoldUptime

	vim.lsp.set_log_level(conf.log.level)
	vim.diagnostic.config(conf.diagnostic)

	-- https://github.com/hrsh7th/cmp-nvim-lsp#capabilities
	local capabilities = require('cmp_nvim_lsp').default_capabilities()
	vim.lsp.config('*', {
		capabilities = capabilities,
		-- Use LspAttach autocmd insteads of on_attach function
		-- on_attach = on_attach, -- on_attach: function(client, bufnr) end
		-- handlers = handlers,
		flags = {
			debounce_text_changes = 150, -- This is default in neovim
			-- Milliseconds to wait for server to exit cleanly after sending the "shutdown" request
			-- before sending kill -15.
			-- If set to false, nvim exits immediately after sending the "shutdown" request to the server.
			exit_timeout = false, -- `integer|false`, default: `false`)
		},
	})

	local lspUserSetups = config.lsp.setup
	local lspconfig = require('lspconfig')

	for serverName, opts in ipairs(lspUserSetups) do
		if type(opts) == 'function' then opts = opts(lspconfig) or {} end
		vim.lsp.config(serverName, opts)
	end

	local masonLspconfig = require('mason-lspconfig')
	masonLspconfig.setup(conf.masonLspconfig)
end

M.keymaps = require('one.plugins.lsp.keymaps')

M.autocmds = {
	-- Show line diagnostics automatically in hover window
	-- The CursorHold autocmd is triggered when updatetime.
	CursorHold = {
		callback = function()
			vim.diagnostic.open_float()
		end,
	},
}

return M
