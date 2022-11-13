return {
	'rmagatti/goto-preview',

	defaultConfig = {
		{ 'lsp', 'preview' },
		{
			width = 80, -- Width of the floating window
			height = 15, -- Height of the floating window
			border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' }, -- Border characters of the floating window
			default_mappings = false, -- Bind default mappings
			debug = false, -- Print debug information
			opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
			resizing_mappings = false, -- Binds arrow keys to resizing the floating window.

			post_open_hook = function() -- A function taking two arguments, a buffer and a window to be ran as a hook.
				vim.wo.cc = '';
			end,

			references = { -- Configure the telescope UI for slowing the references cycling window.
				telescope = {
					layout_strategy = 'vertical',

					layout_config = {
						preview_height = { 0.6, min = 10, max = 50 },
						height = { 0.8, min = 30, max = 80 },
						width = { 0.8, min = 80, max = 130 },
						preview_cutoff = 0,
						prompt_position = 'top', -- 'top' or 'bottom'
					},

					preview = {
						---@diagnostic disable-next-line: unused-local
						filetype_hook = function(filepath, bufnr, opts)
							vim.api.nvim_win_set_option(opts.winid, 'number', true)
							return true
						end,
					},
				},
			},

			-- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
			focus_on_open = true, -- Focus the floating window when opening it.
			dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
			force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
			bufhidden = 'wipe', -- the bufhidden option to set on the floating window. See :h bufhidden
		},
	},

	config = function(config)
		require('goto-preview').setup(config.lsp.preview)
	end,

	commands = function()
		return {
			ClearPreviews = { require('goto-preview').close_all_win, { desc = 'close all preview windows' } },
		}
	end,

	keymaps = function()
		local preview = require('goto-preview')

		return {

			-- If trouble plugin enabled, "gD" keymap will be overridden
			{
				'n',
				'gD',
				require('one.util').gotoDef,
				{
					silent = true,
					desc = 'Jump to the definition of the symbol under the cursor in current window',
				},
			},

			{
				'n',
				'gd',
				preview.goto_preview_definition,
				{
					silent = true,
					desc = 'Open float window to query the definition of the symbol under the cursor',
				},
			},

			{
				'n',
				'gt',
				preview.goto_preview_type_definition,
				{
					silent = true,
					desc = 'Open float window to preview type definition about the symbol under cursor',
				},
			},

			{
				'n',
				'gi',
				preview.goto_preview_implementation,
				{ silent = true, desc = 'Show implementation about the symbol under cursor' },
			},

			{
				'n',
				'gr',
				preview.goto_preview_references,
				{ silent = true, desc = 'Open float window to show references about the symbol under cursor' },
			},
		}
	end,
}
