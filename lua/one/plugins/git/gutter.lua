local M = { 'airblade/vim-gitgutter', desc = 'Git Gutter', disable = true }

local function configKeymaps()
	vim.cmd [[
		function! ToggleGitGutterPreview()
			let g:gitgutter_preview_active = !g:gitgutter_preview_active
			if (g:gitgutter_preview_active)
				if (!empty(gitgutter#hunk#current_hunk()))
					call gitgutter#preview_hunk()
				endif
				echo 'GitGutter AutoPreview: on'
			else
				pclose
				echo 'GitGutter AutoPreview: off'
			endif
		endfunction

		nmap [g <Plug>(GitGutterPrevHunk)
		nmap ]g <Plug>(GitGutterNextHunk)
		nmap <leader>gp <Plug>(GitGutterPreviewHunk)
		nmap <leader>gu <Plug>(GitGutterUndoHunk)
		nmap <leader>ga <Plug>(GitGutterStageHunk)
		nmap <leader>gl <Plug>(GitGutterLineHighlightsToggle)
		nmap <leader>gt :call ToggleGitGutterPreview()<CR>
		nmap <leader>gc :pclose<CR>
	]]
end

function M.config()
	vim.g.gitgutter_map_keys = 0
	vim.g.gitgutter_preview_active = 0
	vim.g.gitgutter_last_line_number = 0
	vim.g.gitgutter_sign_added = '┃'
	vim.g.gitgutter_sign_modified = '┃'
	vim.g.gitgutter_sign_removed = '_'
	vim.g.gitgutter_sign_removed_first_line = '‾'
	vim.g.gitgutter_sign_removed_above_and_below = 'ニ'
	vim.g.gitgutter_sign_modified_removed = '⋍'

	vim.cmd [[
		hi GitGutterDelete guifg=#BF3100 guibg=none guisp=none ctermfg=9 ctermbg=0 guisp=none
		hi GitGutterAdd guifg=#75C44E guibg=none guisp=none ctermfg=10 ctermbg=0 guisp=none
		hi GitGutterChange guifg=#C3B11A guibg=none guisp=none ctermfg=10 ctermbg=0 guisp=none

		au CursorMoved * if g:gitgutter_preview_active && exists('*gitgutter#utility#is_active') && gitgutter#utility#is_active() && line('.') != g:gitgutter_last_line_number |
		\   let g:gitgutter_last_line_number = line('.') |
		\   if empty(gitgutter#hunk#current_hunk()) |
		\     pclose |
		\   else |
		\     call gitgutter#preview_hunk() |
		\   endif |
		\ endif
	]]

	configKeymaps()
end

return M
