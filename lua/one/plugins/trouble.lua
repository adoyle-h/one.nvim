return {
	'folke/trouble.nvim',

	keymaps = {
		{
			'n',
			'<space>d',
			':TroubleToggle document_diagnostics<cr>',
			{ silent = true, desc = 'Find diagnostics in current buffer' },
		},

		{
			'n',
			'<space>D',
			':TroubleToggle workspace_diagnostics<cr>',
			{ silent = true, desc = 'Find diagnostics in workspace' },
		},

		{
			'n',
			'gD',
			':TroubleToggle lsp_definitions<cr>',
			{ silent = true, desc = 'Jump to the definition of the symbol under the cursor' },
		},

		{
			'n',
			'gT',
			':TroubleToggle lsp_type_definitions<cr>',
			{ silent = true, desc = 'Goto preview type definition about the symbol under cursor' },
		},

		{
			'n',
			'gR',
			':TroubleToggle lsp_references<cr>',
			{ silent = true, desc = 'Show references about the symbol under cursor' },
		},

		-- { 'n', '<leader>il', ':TroubleToggle loclist<cr>', { silent = true } },
		-- { 'n', '<leader>iq', ':TroubleToggle quickfix<cr>', { silent = true } },
	},

	config = function(config)
		require('trouble').setup(config.trouble)
	end,

	defaultConfig = function(config)
		local symbolMap = config.symbolMap
		return {
			'trouble',
			{
				position = 'bottom', -- position of the list can be: bottom, top, left, right
				height = 10, -- height of the trouble list when position is top or bottom
				width = 50, -- width of the list when position is left or right
				icons = true, -- use devicons for filenames
				mode = 'workspace_diagnostics', -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
				fold_open = symbolMap.EXPANDED_L, -- icon used for open folds
				fold_closed = symbolMap.COLLAPSED_L, -- icon used for closed folds
				group = true, -- group results by file
				padding = true, -- add an extra new line on top of the list
				action_keys = { -- key mappings for actions in the trouble list
					-- map to {} to remove a mapping, for example:
					-- close = {},
					close = 'q', -- close the list
					cancel = '<esc>', -- cancel the preview and get back to your last window / buffer / cursor
					refresh = 'r', -- manually refresh
					jump = { '<cr>' }, -- jump to the diagnostic or open / close folds
					open_split = { '<c-s>' }, -- open buffer in new split
					open_vsplit = { '<c-v>' }, -- open buffer in new vsplit
					open_tab = { '<c-t>' }, -- open buffer in new tab
					jump_close = { 'o' }, -- jump to the diagnostic and close the list
					toggle_mode = 'm', -- toggle between "workspace" and "document" diagnostics mode
					toggle_preview = 'P', -- toggle auto_preview
					hover = 'K', -- opens a small popup with the full multiline message
					preview = 'p', -- preview the diagnostic location
					close_folds = { 'zM', 'zm' }, -- close all folds
					open_folds = { 'zR', 'zr' }, -- open all folds
					toggle_fold = { '<tab>', 'zA', 'za' }, -- toggle fold of current file
					previous = 'k', -- previous item
					next = 'j', -- next item
				},
				indent_lines = true, -- add an indent guide below the fold icons
				auto_open = false, -- automatically open the list when you have diagnostics
				auto_close = false, -- automatically close the list when you have no diagnostics
				auto_preview = false, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
				auto_fold = false, -- automatically fold a file trouble list at creation
				auto_jump = { 'lsp_definitions', 'lsp_type_definitions', 'lsp_references' }, -- for the given modes, automatically jump if there is only a single result
				signs = {
					-- icons / text used for a diagnostic
					error = symbolMap.ERROR,
					warning = symbolMap.WARN,
					hint = symbolMap.HINT,
					information = symbolMap.INFO,
					other = symbolMap.OTHER,
				},
				use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
			},
		}
	end,
}
