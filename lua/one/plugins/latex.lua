return {
	'latex',

	disable = true,

	requires = { 'jbyuki/nabla.nvim' },

	commands = {
		LatexPreview = {
			function()
				require('nabla').popup { border = 'rounded' }
			end,
		},

		LatexToggleVirt = {
			function()
				require('nabla').toggle_virt()
			end,
		},
	},

	filetypes = {
		text = function()
			require('nabla').enable_virt()
		end,

		plaintex = function()
			require('nabla').enable_virt()
		end,
	},

}
