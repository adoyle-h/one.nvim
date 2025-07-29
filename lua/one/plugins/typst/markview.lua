return {
	'OXY2DEV/markview.nvim',

	priority = 49, -- markview.nvim must be loaded before nvim-treesitter

	config = function(config)
		require('markview').setup(config.markview)
	end,

	defaultConfig = { 'markview', {
		experimental = {
			date_formats = {},
			date_time_formats = {},

			text_filetypes = {},
			read_chunk_size = 1000,
			link_open_alerts = false,
			prefer_nvim = true,
			file_open_command = 'tabnew',

			list_empty_line_tolerance = 3,
		},

		highlight_groups = {},

		preview = {
			enable = false,
			filetypes = { 'md', 'rmd', 'quarto' },
			ignore_buftypes = { 'nofile' },

			modes = { 'n', 'no', 'c' },
			hybrid_modes = {},
			debounce = 50,
			draw_range = { vim.o.lines, vim.o.lines },
			edit_range = { 1, 0 },

			callbacks = {},

			splitview_winopts = { split = 'left' },
		},

		renderers = {},

		html = {
			enable = false,
			container_elements = {},
			headings = {},
			void_elements = {},
		},

		latex = {
			enable = false,
			blocks = {},
			commands = {},
			escapes = {},
			fonts = {},
			inlines = {},
			parenthesis = {},
			subscripts = {},
			superscripts = {},
			symbols = {},
			texts = {},
		},

		markdown = {
			enable = false,
			block_quotes = {},
			code_blocks = {},
			headings = {},
			horizontal_rules = {},
			list_items = {},
			metadata_plus = {},
			metadata_minus = {},
			tables = {},
		},

		markdown_inline = {
			enable = false,
			block_references = {},
			checkboxes = {},
			emails = {},
			embed_files = {},
			entities = {},
			escapes = {},
			footnotes = {},
			highlights = {},
			hyperlinks = {},
			images = {},
			inline_codes = {},
			internal_links = {},
			uri_autolinks = {},
		},

		typst = {
			enable = true,
			codes = {},
			escapes = {},
			headings = {},
			labels = {},
			list_items = {},
			math_blocks = {},
			math_spans = {},
			raw_blocks = {},
			raw_spans = {},
			reference_links = {},
			subscripts = {},
			superscript = {},
			symbols = {},
			terms = {},
			url_links = {},
		},

		yaml = {
			enable = false,
			properties = {},
		},
	} },

}
