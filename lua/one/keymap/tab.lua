local M = { 'keymap.tab' }

M.config = function()
	vim.g.lasttab = 1

	vim.api.nvim_create_autocmd({ 'TabLeave' }, {
		callback = function()
			vim.g.lasttab = vim.fn.tabpagenr()
		end,
		-- nested = true,
	})
end

M.keymaps = function()
	local modes = { 'n', 'c', 'v' }
	local opts = { noremap = true, silent = true }

	return {
		{ modes, '<C-t>-', ':execute "tabn ".g:lasttab<CR>', opts },
		{ modes, '<M-]>', ':tabnext<CR>', opts },
		{ modes, '<M-[>', ':tabprev<CR>', opts },
		{ modes, '<C-t>j', ':tabnext<CR>', opts },
		{ modes, '<C-t>k', ':tabprev<CR>', opts },
		{ modes, '<M-{>', ':tabmove -<CR>', opts },
		{ modes, '<M-}>', ':tabmove +<CR>', opts },
		{ modes, '<C-t>h', ':tabmove -<CR>', opts },
		{ modes, '<C-t>l', ':tabmove +<CR>', opts },
		{ modes, '<C-t>n', ':tabnew<CR>', opts },
		{ modes, '<C-t>x', ':tabclose<CR>', opts },

		-- switch tab in normal mode
		{ 'n', '<leader>1', '1gt', opts },
		{ 'n', '<leader>2', '2gt', opts },
		{ 'n', '<leader>3', '3gt', opts },
		{ 'n', '<leader>4', '4gt', opts },
		{ 'n', '<leader>5', '5gt', opts },
		{ 'n', '<leader>6', '6gt', opts },
		{ 'n', '<leader>7', '7gt', opts },
		{ 'n', '<leader>8', '8gt', opts },
		{ 'n', '<leader>9', '9gt', opts },
		{ 'n', '<leader>0', ':tablast<CR>', opts },
	}
end

return M
