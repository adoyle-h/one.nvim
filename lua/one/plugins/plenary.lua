return {
	'nvim-lua/plenary.nvim',

	commands = {
		TestLuaSpec = {
			function()
				require('plenary.test_harness').test_directory(vim.fn.expand('%:p'))
			end,
			{ desc = 'Run unit test on current lua spec file' },
		},
	},
}
