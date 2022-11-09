local M = {
	'vim-airline/vim-airline',
	desc = 'vim-airline',
	requires = { 'vim-airline/vim-airline-themes' },
}

local function initAirline()
	-- :h airline-predefined-parts
	-- let g:airline_section_a = airline#section#create_left(['mode', 'crypt', 'paste', 'keymap', 'spell', 'capslock', 'xkblayout', 'iminsert'])
	vim.g.airline_section_b = vim.fn['airline#section#create']({ '%l/%L|%c' })
	-- let g:airline_section_x = airline#section#create_right(['bookmark', 'tagbar', 'vista', 'gutentags', 'grepper', 'filetype'])
	-- let g:airline_section_y = airline#section#create_right([])
	vim.g.airline_section_z = vim.fn['airline#section#create']({
		'ts=%{&tabstop}|sw=%{&shiftwidth}|fdl=%{&foldlevel}',
	})
end

local function configAirlineExtensions()
	vim.cmd [[
		let g:airline#extensions#hunks#enabled = 0
		let g:airline#extensions#branch#enabled = 0

		let g:airline#extensions#tagbar#enabled = 1
		let g:airline#extensions#tagbar#flags = 'f'

		let g:airline#extensions#whitespace#skip_indent_check_ft = {
	 	\  'go': ['mixed-indent-file', 'indent'],
		\}

		let g:airline#extensions#tabline#enabled = 1
		let g:airline#extensions#tabline#show_tab_type = 1 " show tab label
		let g:airline#extensions#tabline#tabs_label = 'Tab'
		let g:airline#extensions#tabline#show_splits = 0
		let g:airline#extensions#tabline#show_tab_count = 0
		let g:airline#extensions#tabline#show_tab_nr = 1
		let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
		let g:airline#extensions#tabline#buffers_label = 'Buff'
		let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
		let g:airline#extensions#tabline#show_buffers = 0
		let g:airline#extensions#tabline#buffer_nr_show = 1
		let g:airline#extensions#tabline#buffer_nr_format = '[%s]'
		let g:airline#extensions#tabline#left_sep = ''
		let g:airline#extensions#tabline#left_alt_sep = '|'
		let g:airline#extensions#tabline#right_sep = ''
		let g:airline#extensions#tabline#right_alt_sep = '|'
		let g:airline#extensions#tabline#show_close_button = 0
		let g:airline#extensions#tabline#ignore_bufadd_pat = '\c\vgundo|undotree|vimfiler|tagbar|nerd_tree'
		let g:airline#extensions#tabline#formatter = 'short_path'
		let g:airline#extensions#tabline#overflow_marker = '…'
		let g:airline#extensions#tabline#tabtitle_formatter = 'MyAirlineTabTitleFormatter'

		function MyAirlineTabTitleFormatter(n)
			let buflist = tabpagebuflist(a:n)
			let winnr = tabpagewinnr(a:n)
			let bufnr = buflist[winnr - 1]
			let winid = win_getid(winnr, a:n)
			" let title = bufname(bufnr)
			let title = airline#extensions#tabline#get_buffer_name(bufnr, buflist)

			if empty(title)
				let title = '[No Name]'
			endif

			return title
		endfunction

		" Or Use ['all'] to enable for all filetypes.
		let g:airline#extensions#wordcount#filetypes = [
			\'asciidoc', 'help', 'mail', 'markdown', 'org', 'rst', 'tex', 'text',
			\]

		function! PatchInactiveStatusLine(...)
			call setwinvar(a:2.winnr, 'airline_section_a', '')
			call setwinvar(a:2.winnr, 'airline_section_b', '')
			call setwinvar(a:2.winnr, 'airline_section_x', '')
			call setwinvar(a:2.winnr, 'airline_section_y', '')
			call setwinvar(a:2.winnr, 'airline_section_z', '')
		endfunction
		call airline#add_inactive_statusline_func('PatchInactiveStatusLine')
	]]
end

function M.config(config)
	for key, val in pairs(config.tagbar) do vim.g['airline_' .. key] = val end

	configAirlineExtensions()
end

M.autocmds = { User = { pattern = 'AirlineAfterInit', callback = initAirline } }

M.defaultConfig = {
	'arline',
	{
		theme = 'bubblegum',
		powerline_fonts = 1,

		mode_map = {
			n = 'N',
			i = 'I',
			c = 'C',
			R = 'R',
			s = 'S',
			t = 'T',
			v = 'V',
			V = 'V-LINE',
			['^V'] = 'V-BLOCK',
			multi = 'M',
			['S '] = 'S-LINE',
			['^S'] = 'S-BLOCK',
			ni = '(INSERT)',
			ic = 'INSERT COMPL',
			no = 'OP PENDING',
			Rv = 'V REPLACE',
			ix = 'INSERT COMPL',
			['__'] = '------',
		},

		-- vim-airline symbols
		symbols = { paste = 'Ƥ', spell = 'Ȿ', branch = '', crypt = '🔒' },
	},
}

return M
