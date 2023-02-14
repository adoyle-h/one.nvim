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

	config = function(config)
		for key, value in pairs(config.markdown.toc) do vim.g['vmt_' .. key] = value end
	end,

	commands = { TocInsert = 'GenTocGFM', TocUpdate = 'UpdateToc' },
}
