return {
	'zk',
	disable = true,

	requires = { 'mickael-menu/zk-nvim', 'prncss-xyz/neo-tree-zk.nvim' },

	config = function(config)
		require('zk').setup(config.zk)
	end,

	defaultConfig = {
		'zk',
		{
			-- can be "telescope", "fzf" or "select" (`vim.ui.select`)
			-- it's recommended to use "telescope" or "fzf"
			picker = 'select',

			lsp = {
				-- `config` is passed to `vim.lsp.start_client(config)`
				config = {
					cmd = { 'zk', 'lsp' },
					name = 'zk',
					-- on_attach = ...
					-- etc, see `:h vim.lsp.start_client()`
				},

				-- automatically attach buffers in a zk notebook that match the given filetypes
				auto_attach = { enabled = true, filetypes = { 'markdown' } },
			},
		},
	},

	keymaps = {

		{ 'n', '<space>Z', ':Neotree toggle zk<CR>', { silent = true } },

		{
			'n',
			'<leader>zn',
			function()
				require('zk.commands').get('ZkNew')({ title = vim.fn.input('New Note Title: ') })
			end,
			{ desc = 'Create a new note after asking for its title.' },
		},

		{
			'v',
			'<leader>zn',
			function()
				require('zk.commands').get('ZkNewFromContentSelection')({
					title = vim.fn.input('New Note Title: '),
				})
			end,
		},

		{
			'n',
			'<leader>zo',
			function()
				require('zk.commands').get('ZkNotes')({ sort = { 'modified' } })
			end,
			{ desc = 'Open note.' },
		},

		{
			'n',
			'<leader>zt',
			function()
				require('zk.commands').get('ZkTags')({})
			end,
			{ desc = 'Open notes associated with the selected tags.' },
		},

		{
			'n',
			'<leader>zi',
			function()
				require('zk.commands').get('ZkIndex')()
			end,
			{ desc = 'Search for the notes matching a given query.' },
		},

		{
			'n',
			'<leader>zl',
			function()
				require('zk.commands').get('ZkLinks')({})
			end,
			{ desc = 'Search for the notes matching a given query.' },
		},

		{
			'v',
			'<leader>zf',
			function()
				require('zk.commands').get('ZkMatch')({})
			end,
			{ silent = false, desc = 'Search for the notes matching the current visual selection.' },
		},

	},
}
