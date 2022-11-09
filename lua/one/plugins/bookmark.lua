local M = {
	'bookmark',
	requires = { 'MattesGroeger/vim-bookmarks' },
	desc = 'bookmark',
	disable = true,
}

M.highlights = {
	BookmarkSign = { ctermbg = 234, ctermfg = 27 },
	BookmarkLine = { ctermbg = 'NONE', ctermfg = 'NONE' },
	BookmarkAnnotationSign = { ctermbg = 234, ctermfg = 35 },
	BookmarkAnnotationLine = { ctermbg = 'NONE', ctermfg = 'NONE' },
}

M.keymaps = {
	{ 'n', '<Leader>bb', '<Plug>BookmarkToggle' },
	{ 'n', '<Leader>ba', '<Plug>BookmarkAnnotate' },
	{ 'n', '<Leader>bs', '<Plug>BookmarkShowAll' },
	{ 'n', '<Leader>bl', '<Plug>BookmarkShowAll' },
	{ 'n', '<Leader>bj', '<Plug>BookmarkNext<CR>k<Leader>b' },
	{ 'n', '<Leader>bk', '<Plug>BookmarkPrev<CR>k<Leader>b' },
	{ 'n', '<Leader>bc', '<Plug>BookmarkClear<CR>' },
	{ 'n', '<Leader>bC', '<Plug>BookmarkClearAll' },
	{ 'n', '<Leader>bK', '<Plug>BookmarkMoveUp<CR>k<Leader>b' },
	{ 'n', '<Leader>bJ', '<Plug>BookmarkMoveDown<CR>k<Leader>b' },
	{ 'n', '<Leader>bt', '<Plug>BookmarkMoveToLine' },
}

function M.config(config)
	local symbolMap = config.symbolMap

	vim.g.bookmark_no_default_key_mappings = 1
	vim.g.bookmark_sign = symbolMap.BOOKMARK
	vim.g.bookmark_annotation_sign = symbolMap.BOOKMARK_ANNOTATION
	vim.g.bookmark_highlight_lines = 1
	vim.g.bookmark_location_list = 1
end

return M
