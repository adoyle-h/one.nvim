return {
	'Exafunction/codeium.vim',
	id = 'codeium',

	defaultConfig = { 'codeium', {} },

	config = function()
		vim.g.codeium_disable_bindings = 1
	end,

	keymaps = {
		{
			'i',
			'<M-a>',
			function()
				return vim.fn['codeium#Accept']()
			end,
			{ silent = true, expr = true },
		},

		{
			'i',
			'<c-;>',
			function()
				return vim.fn['codeium#CycleCompletions'](1)
			end,
			{ expr = true },
		},

		{
			'i',
			'<c-,>',
			function()
				return vim.fn['codeium#CycleCompletions'](-1)
			end,
			{ expr = true },
		},

		{
			'i',
			'<c-x>',
			function()
				return vim.fn['codeium#Clear']()
			end,
			{ expr = true },
		},
	},
}
