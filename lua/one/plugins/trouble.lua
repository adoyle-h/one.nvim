return {
	'folke/trouble.nvim',

	highlights = function(config)
		local c = config.colors

		return {
			TroubleNormal = {},
			TroubleCount = { fg = c.yellow },
			TroubleFile = { fg = c.blue },
			TroubleFoldIcon = { fg = c.grey4 },
			TroubleLocation = { fg = c.grey },
			TroubleError = { fg = c.red },
			TroubleWarning = { fg = c.yellow },
			TroubleInformation = { fg = c.blue },
			TroubleHint = { fg = c.cyan },
			TroubleTextError = { fg = c.red },
			TroubleTextWarning = { fg = c.yellow },
			TroubleTextInformation = { fg = c.blue },
			TroubleTextHint = { fg = c.cyan },
			TroubleText = { fg = c.white },
		}
	end,

	keymaps = {
		{
			'n',
			'<space>d',
			':Trouble diagnostics toggle filter.buf=0<CR>',
			{ silent = true, desc = 'Find diagnostics in current buffer' },
		},

		{
			'n',
			'<space>D',
			':Trouble diagnostics toggle<CR>',
			{ silent = true, desc = 'Find diagnostics in workspace' },
		},

		{
			'n',
			'gD',
			':Trouble lsp_definitions toggle<cr>',
			{ silent = true, desc = 'Jump to the definition of the symbol under the cursor' },
		},

		{
			'n',
			'gT',
			':Trouble lsp_type_definitions toggle<cr>',
			{ silent = true, desc = 'Goto preview type definition about the symbol under cursor' },
		},

		{
			'n',
			'gR',
			':Trouble lsp_references toggle<cr>',
			{ silent = true, desc = 'Show references about the symbol under cursor' },
		},
	},

	config = function(c)
		require('trouble').setup(c.trouble)
	end,

	defaultConfig = function(config)
		local symbolMap, kindSymbolMap = config.symbolMap, config.kindSymbolMap

		return {
			'trouble',
			{
				auto_close = false, -- auto close when there are no items
				auto_open = false, -- auto open when there are items
				auto_preview = false, -- automatically open preview when on an item
				auto_refresh = true, -- auto refresh when open
				auto_jump = false, -- auto jump to the item when there's only one
				focus = true, -- Focus the window when opened
				restore = true, -- restores the last location in the list when opening
				follow = true, -- Follow the current item
				indent_guides = true, -- show indent guides
				max_items = 200, -- limit number of items that can be displayed per section
				multiline = true, -- render multi-line messages
				pinned = false, -- When pinned, the opened trouble window will be bound to the current buffer
				warn_no_results = true, -- show a warning when there are no results
				open_no_results = false, -- open the trouble window when there are no results
				---@type trouble.Window.opts
				win = {}, -- window options for the results window. Can be a split or a floating window.
				-- Window options for the preview window. Can be a split, floating window,
				-- or `main` to show the preview in the main editor window.
				---@type trouble.Window.opts
				preview = {
					type = 'main',
					-- when a buffer is not yet loaded, the preview window will be created
					-- in a scratch buffer with only syntax highlighting enabled.
					-- Set to false, if you want the preview to always be a real loaded buffer.
					scratch = true,
				},
				-- Throttle/Debounce settings. Should usually not be changed.
				---@type table<string, number|{ms:number, debounce?:boolean}>
				throttle = {
					refresh = 20, -- fetches new data when needed
					update = 10, -- updates the window
					render = 10, -- renders the window
					follow = 100, -- follows the current item
					preview = { ms = 100, debounce = true }, -- shows the preview for the current item
				},

				-- Key mappings can be set to the name of a builtin action,
				-- or you can define your own custom action.
				---@type table<string, trouble.Action.spec>
				keys = {
					['?'] = 'help',
					r = 'refresh',
					R = 'toggle_refresh',
					q = 'close',
					o = 'jump_close',
					['<esc>'] = 'cancel',
					['<cr>'] = 'jump',
					['<2-leftmouse>'] = 'jump',
					['<c-s>'] = 'jump_split',
					['<c-v>'] = 'jump_vsplit',
					-- ['<c-t>'] = 'open_tab', -- open buffer in new tab

					-- go down to next item (accepts count)
					j = 'next',
					['}'] = 'next',
					[']]'] = 'next',
					-- go up to prev item (accepts count)
					k = 'prev',
					['{'] = 'prev',
					['[['] = 'prev',
					dd = 'delete',
					d = { action = 'delete', mode = 'v' },
					i = 'inspect',
					p = 'preview',
					P = 'toggle_preview',
					zo = 'fold_open',
					zO = 'fold_open_recursive',
					zc = 'fold_close',
					zC = 'fold_close_recursive',
					za = 'fold_toggle',
					zA = 'fold_toggle_recursive',
					zm = 'fold_more',
					zM = 'fold_close_all',
					zr = 'fold_reduce',
					zR = 'fold_open_all',
					zx = 'fold_update',
					zX = 'fold_update_all',
					zn = 'fold_disable',
					zN = 'fold_enable',
					zi = 'fold_toggle_enable',
					gb = { -- example of a custom action that toggles the active view filter
						action = function(view)
							view:filter({ buf = 0 }, { toggle = true })
						end,
						desc = 'Toggle Current Buffer Filter',
					},
					s = { -- example of a custom action that toggles the severity
						action = function(view)
							local f = view:get_filter('severity')
							local severity = ((f and f.filter.severity or 0) + 1) % 5
							view:filter({ severity = severity }, {
								id = 'severity',
								template = '{hl:Title}Filter:{hl} {severity}',
								del = severity == 0,
							})
						end,
						desc = 'Toggle Severity Filter',
					},
				},

				---@type table<string, trouble.Mode>
				modes = {
					-- sources define their own modes, which you can use directly,
					-- or override like in the example below
					lsp_references = {
						-- some modes are configurable, see the source code for more details
						params = {
							include_declaration = true,
						},
					},
					-- The LSP base mode for:
					-- * lsp_definitions, lsp_references, lsp_implementations
					-- * lsp_type_definitions, lsp_declarations, lsp_command
					lsp_base = {
						params = {
							-- don't include the current location in the results
							include_current = false,
						},
					},

					lsp_document_symbols = {
						win = { position = 'right' }, -- position of the list can be: bottom, top, left, right
					},

					-- more advanced example that extends the lsp_document_symbols
					symbols = {
						desc = 'document symbols',
						mode = 'lsp_document_symbols',
						focus = false,
						filter = {
							-- remove Package since luals uses it for control flow structures
							['not'] = { ft = 'lua', kind = 'Package' },
							any = {
								-- all symbol kinds for help / markdown files
								ft = { 'help', 'markdown' },
								-- default set of symbol kinds
								kind = {
									'Array',
									'Boolean',
									'Class',
									'Constant',
									'Constructor',
									'Enum',
									'EnumMember',
									'Event',
									'Field',
									'File',
									'Function',
									'Interface',
									'Key',
									'Method',
									'Module',
									'Namespace',
									'Null',
									'Number',
									'Object',
									'Operator',
									-- 'Package', -- @TODO Why "if" condition is a Package kind?
									'Property',
									'String',
									'Struct',
									'TypeParameter',
									'Variable',
								},
							},
						},
					},
				},

				-- stylua: ignore
				icons = {
					---@type trouble.Indent.symbols
					indent = {
						top = '│ ',
						middle = '├╴',
						last = '└╴',
						-- last          = "-╴",
						-- last       = "╰╴", -- rounded
						fold_open = symbolMap.EXPANDED_L .. ' ',
						fold_closed = symbolMap.COLLAPSED_L .. ' ',
						ws = '  ',
					},

					folder_closed = symbolMap.FOLDER_CLOSED,
					folder_open = symbolMap.FOLDER_OPEN,

					kinds = kindSymbolMap,
				},

			},
		}
	end,
}
