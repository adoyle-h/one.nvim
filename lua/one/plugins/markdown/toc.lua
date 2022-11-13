return {
	'adoyle-h/vim-MarkdownTOC',
	desc = 'Table of Content generator',
	ft = 'markdown',
	branch = 'adoyle',

	defaultConfig = {
		{ 'markdown', 'toc' },
		{
			style = 'unordered',
			list_item_char = '-',
			fence_text = 'MarkdownTOC',
			fence_closing_text = '/MarkdownTOC',
		},
	},

	config = function()
		local conf = require('one.config').config.markdown.toc
		vim.g.vmt_style = conf.style
		vim.g.vmt_list_item_char = conf.list_item_char
		vim.g.vmt_fence_text = conf.fence_text
		vim.g.vmt_fence_closing_text = conf.fence_closing_text
	end,

	commands = { TocInsert = 'GenTocGFM', TocUpdate = 'UpdateToc' },
}
