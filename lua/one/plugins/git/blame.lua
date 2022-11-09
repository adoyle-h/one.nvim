local M = {
	'f-person/git-blame.nvim',
	desc = 'Git Blame',
	disable = true,
	keymaps = { { 'n', '<leader>gb', ':GitBlameToggle<CR>', { silent = true } } },
}

function M.config(config)
	vim.g.gitblame_enabled = false
	vim.g.gitblame_message_template = '  <date> <author>: <summary>'
	vim.g.gitblame_date_format = '%Y/%m/%d %H:%M:%S'
	vim.g.gitblame_highlight_group = 'GitBlameVirtualText'
	vim.g.gitblame_ignored_filetypes = config.ignore.fileTypesForSomePlugs
end

M.highlights = function(config)
	local colors = config.colors
	return { GitBlameVirtualText = { fg = colors.grey, bg = colors.cursorLineBG, italic = true } }
end
return M
