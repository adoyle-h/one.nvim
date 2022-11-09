local M = {
	'terminal',
	desc = 'The settings of nvim embeded terminal. See :h terminal',
	requires = { require('one.plugins.terminal.neoterm') },
}

local util = require('one.util')

local function send(isSelected)
	local term_buf_id = -1

	for _, buf_id in pairs(vim.fn.tabpagebuflist()) do
		local buf_type = vim.api.nvim_buf_get_option(buf_id, 'buftype')

		if buf_type == 'terminal' then
			term_buf_id = buf_id
			local text = ''

			if isSelected then
				-- Get selected lines
				text = util.getVisualSelection(true)
			else
				-- Get current line
				text = vim.api.nvim_get_current_line()
			end

			local chan_id = vim.api.nvim_buf_get_var(term_buf_id, 'terminal_job_id')

			vim.api.nvim_chan_send(chan_id, vim.trim(text) .. '\n')
		end
	end
end

M.autocmds = {
	TermOpen = {
		callback = function()
			vim.wo.number = false
			vim.wo.rnu = false
		end,
	},
}

M.keymaps = {

	{ 't', 'jk', '<C-\\><C-n>', { noremap = true, desc = 'Exit from terminal mode' } },

	{
		'n',
		'<leader>tt',
		function()
			local cmd = vim.fn.input { prompt = 'New Terminal: ', default = 'bash' }
			vim.cmd.vsplit('term://' .. cmd)
		end,
		{ silent = true, desc = 'Create terminal window' },
	},

	{ 'n', '<leader>ts', send, { silent = true, desc = 'Send text to terminal' } },

	{
		'x',
		'<leader>ts',
		function()
			send(true)
		end,
		{ silent = true, desc = 'Send text to terminal' },
	},

}

return M
