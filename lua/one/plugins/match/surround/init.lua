return {
	deps = {
		{
			'kylechui/nvim-surround',
			desc = 'mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, tags etc.',

			config = function(config)
				vim.g.nvim_surround_no_visual_mappings = true

				require('nvim-surround').setup(config.surround)

				vim.keymap.set('x', 's', '<Plug>(nvim-surround-visual)', {
					desc = 'Add a surrounding pair around a visual selection',
				})
				vim.keymap.set('x', 'gs', '<Plug>(nvim-surround-visual-line)', {
					desc = 'Add a surrounding pair around a visual selection, on new lines',
				})
			end,

		},

		require('one.plugins.match.surround.markdown'),
	},
}
