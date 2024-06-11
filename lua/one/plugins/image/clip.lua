return {
	'HakonHarnes/img-clip.nvim',

	desc = 'Embed images into any markup language, like LaTeX, Markdown or Typst',

	defaultConfig = {
		{ 'image', 'clip' },
		{
			default = {
				-- file and directory options
				dir_path = 'assets', ---@type string
				extension = 'png', ---@type string
				file_name = '%Y-%m-%d-%H-%M-%S', ---@type string
				use_absolute_path = false, ---@type boolean
				relative_to_current_file = false, ---@type boolean

				-- template options
				template = '$FILE_PATH', ---@type string
				url_encode_path = false, ---@type boolean
				relative_template_path = true, ---@type boolean
				use_cursor_in_template = true, ---@type boolean
				insert_mode_after_paste = true, ---@type boolean

				-- prompt options
				prompt_for_file_name = true, ---@type boolean
				show_dir_path_in_prompt = false, ---@type boolean

				-- base64 options
				max_base64_size = 10, ---@type number
				embed_image_as_base64 = false, ---@type boolean

				-- image options
				process_cmd = '', ---@type string
				copy_images = false, ---@type boolean
				download_images = true, ---@type boolean

				-- drag and drop options
				drag_and_drop = {
					enabled = true, ---@type boolean
					insert_mode = false, ---@type boolean
				},
			},

			-- filetype specific options
			filetypes = {},

			-- file, directory, and custom triggered options
			files = {}, ---@type table
			dirs = {}, ---@type table
			custom = {}, ---@type table
		},
	},

	config = function(config)
		require('img-clip').setup(config.image.clip)
	end,

	keymaps = {
		{
			'n',
			'<C-p>',
			function()
				local path = vim.fn.getreg('*')
				vim.print(path)
				if vim.endswith(path, '.png') then
					require('img-clip').paste_image({ use_absolute_path = false }, path)
				else
					vim.cmd.PasteImage()
				end
			end,
			{ desc = 'Paste image from system clipboard' },
		},
	},
}
