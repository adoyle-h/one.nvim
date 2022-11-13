return function()
	local util = require('one.util')
	local tb = require('telescope.builtin')
	local opts = { silent = true }

	local map = {

		{ 'n', '<space>;', require('telescope').extensions.find_pickers.find_pickers },

		{ 'n', '<space>M', ':Telescope man_pages<cr>', opts },

		{ 'n', '<space>f', ':Telescope find_files<cr>', opts },

		{ 'n', '<space>n', ':Telescope message<cr>', opts },

		{
			'v',
			'<space>f',
			function()
				local text = util.getVisualSelection()
				tb.find_files({ default_text = text })
			end,
			{ silent = true, desc = 'Find files with selection' },
		},

		{
			'n',
			'<space>?',
			':Telescope current_buffer_fuzzy_find<cr>',
			{ silent = true, desc = 'Fuzzy find content in current buffer' },
		},

		{
			'v',
			'<space>?',
			function()
				local text = util.getVisualSelection()
				tb.current_buffer_fuzzy_find({ default_text = text })
			end,
			{ silent = true, desc = 'Fuzzy find content in current buffer with selection' },
		},

		{
			'n',
			'<space>/',
			':Telescope live_grep<cr>',
			{ silent = true, desc = 'Fuzzy find content in workspace' },
		},

		{
			'v',
			'<space>/',
			function()
				local text = util.getVisualSelection()
				tb.live_grep({ default_text = text })
			end,
			{ silent = true, desc = 'Fuzzy find content with selection in workspace' },
		},

		{ 'n', '<space>p', ':Telescope commands<cr>', opts },
		{
			'v',
			'<space>p',
			function()
				local text = util.getVisualSelection()
				tb.commands({ default_text = text })
			end,
			{ silent = true, desc = 'List commands with selection' },
		},

		-- Press '<Enter>' to execute command immediately.
		-- Press '<Ctrl-e>' to edit command in terminal mode.
		-- See https://github.com/nvim-telescope/telescope.nvim/pull/656/files
		{ 'n', '<space>C', ':Telescope command_history<cr>', opts },
		{
			'v',
			'<space>C',
			function()
				local text = util.getVisualSelection()
				tb.command_history({ default_text = text })
			end,
			{ silent = true, desc = 'List command history with selection' },
		},

		{ 'n', '<space>h', ':Telescope help_tags<cr>', opts },
		{
			'v',
			'<space>h',
			function()
				local text = util.getVisualSelection()
				tb.help_tags({ default_text = text })
			end,
			{ silent = true, desc = 'List help documents with selection' },
		},

		{ 'n', '<space>H', ':Telescope highlights<cr>', opts },
		{
			'v',
			'<space>H',
			function()
				local text = util.getVisualSelection()
				tb.highlights({ default_text = text })
			end,
			{ silent = true, desc = 'List highlights with selection' },
		},

		{ 'n', '<space>k', ':Telescope keymaps<cr>', opts },
		{
			'v',
			'<space>k',
			function()
				local text = util.getVisualSelection()
				tb.keymaps({ default_text = text })
			end,
			{ silent = true, desc = 'List keymaps with selection' },
		},

		{ 'n', '<space>S', ':Telescope search_history<cr>', opts },
		{ 'n', '<M-s>', ':Telescope spell_suggest<cr>', opts },
		{ 'n', '<space>j', ':Telescope jumplist<cr>', opts },
		{ 'n', '<space>v', ':Telescope vim_options<cr>', opts },
		{ 'n', '<space>R', ':Telescope registers<cr>', opts },
		{ 'n', '<space>l', ':Telescope lsp_document_symbols<cr>', opts },

		{
			'n',
			'<space>r',
			':Telescope oldfiles<cr>',
			{ silent = true, desc = 'Show recently opened files' },
		},

		{ 'n', '<space>b', ':Telescope buffers<cr>', opts }, -- Use neotree plugin will override it
		{ 'n', '<space>d', ':Telescope diagnostics<cr>', opts }, -- Use trouble plugin will override it

		-- Override lsp keymaps. If plugins/lsp/preview enabled, these keymaps will be overridden.
		{ 'n', 'gi', ':Telescope lsp_implementations<cr>', opts },
		{ 'n', 'gd', ':Telescope lsp_definitions jump_type=split<cr>', opts },
		{ 'n', 'gr', ':Telescope lsp_references<cr>', opts },
		{ 'n', 'gt', ':Telescope lsp_type_definitions<cr>', opts },
	}

	return map
end
