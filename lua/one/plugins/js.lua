return {
	filetypes = {
		js = function()
			vim.opt_local.isk:remove{ '.' } -- ':set isk-=.'
		end,

		jsx = function()
			vim.opt_local.isk:remove{ '.' } -- ':set isk-=.'
		end,
	},
}
