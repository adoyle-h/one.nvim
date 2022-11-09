return {
	'windwp/nvim-autopairs',

	config = function(config)
		local conf = config.autopairs
		require('nvim-autopairs').setup(conf.opts)

		local has_cmp, cmp = pcall(require, 'cmp')
		if has_cmp then
			local cmp_autopairs = require('nvim-autopairs.completion.cmp')
			cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done(conf.confirm))
		end
	end,

	defaultConfig = {
		'autopairs',
		{
			opts = {
				disable_filetype = { 'TelescopePrompt', 'neo-tree', 'neo-tree-popup' },
				disable_in_macro = false, -- disable when recording or executing a macro
				disable_in_visualblock = false, -- disable when insert after visual block mode
				-- ignored_next_char = [=[[%w%%%'%[%"%.]]=],
				enable_moveright = true,
				enable_afterquote = true, -- add bracket pairs after quote
				enable_check_bracket_line = true, --- check bracket in same line
				enable_bracket_in_quote = true,
				enable_abbr = false, -- trigger abbreviation
				break_undo = true, -- switch for basic rule break undo sequence
				check_ts = false,
				map_cr = false,
				map_bs = true, -- map the <BS> key
				map_c_h = false, -- Map the <C-h> key to delete a pair
				map_c_w = false, -- map <c-w> to delete a pair if possible
			},

			confirm = {
				filetypes = {
					-- -- "*" is a alias to all filetypes
					-- ['*'] = {
					-- 	['('] = {
					-- 		kind = { cmp.lsp.CompletionItemKind.Function, cmp.lsp.CompletionItemKind.Method },
					-- 		handler = handlers['*'],
					-- 	},
					-- },
					--
					-- lua = {
					-- 	['('] = {
					-- 		kind = { cmp.lsp.CompletionItemKind.Function, cmp.lsp.CompletionItemKind.Method },
					-- 		---@param char string
					-- 		---@param item item completion
					-- 		---@param bufnr buffer number
					-- 		handler = function(char, item, bufnr)
					-- 			-- Your handler function. Inpect with print(vim.inspect{char, item, bufnr})
					-- 		end,
					-- 	},
					-- },
					--
					-- tex = false, -- Disable for tex
				},

			},
		},
	},
}
