local M = {
	'kyazdani42/nvim-tree.lua',

	config = function(config)
		require('nvim-tree').setup(config['nvim-tree'])
	end,

	highlights = function(config)
		local c = config.colors
		return { NvimTreeNormal = { bg = c.grey1 } }
	end,

	defaultConfig = {
		'nvim-tree',
		{
			sort_by = 'case_sensitive',

			threshold = vim.log.levels.WARN,

			remove_keymaps = { 'bmv' },

			view = {
				width = 30,

				mappings = {
					list = {
						{ key = '?', action = 'toggle_help' },
						{ key = 'H', action = 'dir_up' },
						{ key = { 'L', '<C-]>', '<2-RightMouse>' }, action = 'cd' },
						{ key = 'v', action = 'vsplit' },
						{ key = 's', action = 'split' },
						{ key = 't', action = 'tabnew' },
						{ key = 'i', action = 'toggle_dotfiles' },
						{ key = 'p', action = 'parent_node' },
						{ key = 'P', action = 'paste' },
					},
				},

				float = { enable = false },
			},

			renderer = {
				group_empty = true,

				icons = {
					symlink_arrow = ' ➜ ',

					glyphs = {
						git = {
							unstaged = '',
							staged = '',
							unmerged = '',
							renamed = '➜',
							untracked = '',
							deleted = '',
							ignored = '◌',
						},
					},
				},
			},

			filters = { dotfiles = true },

			actions = { use_system_clipboard = true },

		},
	},

	keymaps = {
		{ 'n', '<leader>nm', ':NvimTreeToggle<CR>', { silent = true } },
		{ 'n', '<leader>nf', ':NvimTreeFindFile<CR>', { silent = true } },
		{ 'n', '<space>m', ':NvimTreeToggle<CR>' },
	},
}
