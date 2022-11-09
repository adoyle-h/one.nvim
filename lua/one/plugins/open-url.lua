return {
	'tyru/open-browser.vim',
	on = { '<Plug>(openbrowser-smart-search)', '<Plug>(openbrowser-open)' },
	desc = 'Open url from text with browser',
	config = function()
		vim.g.netrw_nogx = 1 -- disable netrw's gx mapping
	end,

	keymaps = {
		{ { 'n', 'v' }, 'gx', '<Plug>(openbrowser-smart-search)' },
		{ { 'n', 'v' }, 'gX', '<Plug>(openbrowser-open)' },
	},
}
