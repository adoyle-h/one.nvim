local util = require('one.util')

local M = {
	'simnalamburt/vim-mundo',
	desc = 'undo history tree',
	on = 'UndotreeToggle',
	keymaps = { { 'n', '<space>u', ':MundoToggle<CR>' } },
}

M.defaultConfig = {
	'undotree',
	{
		undodir = util.dataPath('undo'),
		undofile = true,
		width = 60,
		preview_height = 15,
		right = 1,
		auto_preview = 1,
	},
}

function M.config(config)
	local conf = config.undotree

	if vim.fn.has('persistent_undo') then
		vim.opt.undodir = conf.undodir
		vim.opt.undofile = conf.undofile
	end

	vim.g.mundo_width = conf.width
	vim.g.mundo_preview_height = conf.preview_height
	vim.g.mundo_right = conf.right
	vim.g.mundo_auto_preview = conf.auto_preview
end

return M
