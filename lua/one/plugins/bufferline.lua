local M = { 'akinsho/bufferline.nvim', tag = 'v3.*', requires = { 'tiagovla/scope.nvim' } }

M.keymaps = function()
	local modes = { 'n', 'c', 'v' }
	local opts = { noremap = true, silent = true }

	return {
		{ modes, '<M-[>', ':BufferLineCyclePrev<CR>', opts },
		{ modes, '<M-]>', ':BufferLineCycleNext<CR>', opts },
		-- BUG: https://github.com/akinsho/bufferline.nvim/pull/588#issuecomment-1304598656
		{ modes, '<M-{>', ':BufferLineMovePrev<CR>', opts },
		{ modes, '<M-}>', ':BufferLineMoveNext<CR>', opts },
		{ modes, '<leader>1', ':BufferLineGoToBuffer 1<CR>', opts },
		{ modes, '<leader>2', ':BufferLineGoToBuffer 2<CR>', opts },
		{ modes, '<leader>3', ':BufferLineGoToBuffer 3<CR>', opts },
		{ modes, '<leader>4', ':BufferLineGoToBuffer 4<CR>', opts },
		{ modes, '<leader>5', ':BufferLineGoToBuffer 5<CR>', opts },
		{ modes, '<leader>6', ':BufferLineGoToBuffer 6<CR>', opts },
		{ modes, '<leader>7', ':BufferLineGoToBuffer 7<CR>', opts },
		{ modes, '<leader>8', ':BufferLineGoToBuffer 8<CR>', opts },
		{ modes, '<leader>9', ':BufferLineGoToBuffer 9<CR>', opts },
		{ modes, '<leader>0', ':BufferLineGoToBuffer -1<CR>', opts },
	}
end

function M.config(config)
	local conf = config.bufferline

	if conf.options.mode == 'buffers' then
		-- Temp Fix: buffers per tab
		-- see https://github.com/akinsho/bufferline.nvim#how-do-i-see-only-buffers-per-tab
		require('scope').setup()
	end

	require('bufferline').setup(conf)
end

M.defaultConfig = function(config)
	local colors = config.colors
	local selectedBG = '#1b2430'
	local bufferBG = '#12151a'
	local white = colors.white
	local grey = colors.grey
	local blue = colors.blue
	local yellow = colors.yellow

	return {
		'bufferline',
		{
			options = {
				mode = 'buffers', -- 'tabs' or 'buffers'
				numbers = 'ordinal',
				diagnostics = false, -- false | 'nvim_lsp' | 'coc',

				indicator = {
					icon = '▎', -- this should be omitted if indicator style is not 'icon'
					style = 'icon', -- 'icon'| 'underline' | 'none',
				},

				show_buffer_icons = false, -- disable filetype icons for buffers
				show_buffer_close_icons = true,
				show_tab_indicators = true,
				show_duplicate_prefix = true,
				show_close_icon = false,
				buffer_close_icon = '',
				modified_icon = '*',
				close_icon = '',
				left_trunc_marker = '',
				right_trunc_marker = '',
				color_icons = true,
				separator_style = { '', '' }, -- 'slant' | 'thick' | 'thin' | { 'any', 'any' },
				max_name_length = 20,
				truncate_names = true,

				offsets = {
					{
						filetype = 'neo-tree',
						text = '[File Explorer]',
						text_align = 'center', -- 'left' | 'center' | 'right'
						highlight = 'BufferLineInfoSelected',
						separator = true,
					},

					{
						filetype = 'NvimTree',
						text = '[File Explorer]',
						text_align = 'center', -- 'left' | 'center' | 'right'
						highlight = 'BufferLineInfoSelected',
						separator = true,
					},

					{
						filetype = 'aerial',
						text = '[Outline]',
						text_align = 'center', -- 'left' | 'center' | 'right'
						highlight = 'BufferLineInfoSelected',
						separator = true,
					},

				},
			},

			highlights = {
				fill = { -- It's background
					fg = grey,
					bg = colors.black,
				},

				background = { -- unselected buffers
					fg = grey,
					bg = bufferBG,
				},

				indicator_selected = { fg = blue, bg = selectedBG },

				buffer_visible = { fg = white, bg = selectedBG },

				tab = { fg = grey, bg = bufferBG },
				tab_selected = { fg = white, bg = selectedBG },
				tab_close = { fg = grey, bg = bufferBG },

				modified = { fg = yellow, bg = bufferBG },
				modified_visible = { fg = yellow, bg = selectedBG },
				modified_selected = { fg = yellow, bg = selectedBG },

				duplicate_selected = { fg = white, bg = selectedBG, italic = true },
				duplicate_visible = { fg = grey, bg = selectedBG, italic = true },
				duplicate = { fg = grey, bg = bufferBG, italic = true },

				buffer_selected = { fg = white, bg = selectedBG, bold = false, italic = false },

				numbers = { fg = grey, bg = bufferBG },
				numbers_selected = { fg = white, bg = selectedBG, bold = false, italic = false },
				numbers_visible = { fg = white, bg = selectedBG },

				close_button = { bg = bufferBG },
				close_button_selected = { fg = blue, bg = selectedBG },
				close_button_visible = { fg = blue, bg = selectedBG },
			},
		},
	}
end

return M
