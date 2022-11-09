return {
	'plasticboy/vim-markdown',

	ft = 'markdown',

	config = function(config)
		for key, val in pairs(config.markdown.main) do vim.g['vim_markdown_' .. key] = val end
	end,

	defaultConfig = {
		{ 'markdown', 'main' },
		{
			no_default_key_mappings = 1,
			frontmatter = 1,
			conceal = 1,
			conceal_code_blocks = 0,
			toc_autofit = 1,
			emphasis_multiline = 0,
			fenced_languages = { 'csharp=cs', 'js=javascript' },
			new_list_item_indent = 2,
		},
	},
}
