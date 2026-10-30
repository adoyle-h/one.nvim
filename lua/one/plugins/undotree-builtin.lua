vim.cmd.packadd('nvim.undotree')

return {
	'nvim.undotree',
	desc = 'nvim builtin undotree',
	keymaps = { { 'n', '<space>u', require('undotree').open } },
}
