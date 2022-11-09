local M = { 'keymap.indent', desc = 'indent keymaps' }

local function indentLevel(lnum)
	return vim.fn.indent(lnum) / vim.bo.shiftwidth
end

M.keymaps = {

	{ 'n', '<', '<<', { noremap = true, silent = true, desc = 'unindent line' } },
	{ 'n', '>', '>>', { noremap = true, silent = true, desc = 'indent line' } },

	{
		'v',
		'<',
		'<gv',
		{ noremap = true, silent = true, desc = 'unindent line while keep visual selected' },
	},

	{
		'v',
		'>',
		'>gv',
		{ noremap = true, silent = true, desc = 'indent line while keep visual selected' },
	},

	{
		'n',
		'<Tab>',
		'za',
		{
			noremap = true,
			silent = true,
			desc = 'When cursor on a closed fold: open it. When cursor on an open fold, close it.',
		},
	},

	{
		'n',
		'<M-Tab>',
		function()
			local l = indentLevel(vim.fn.line('.')) - 1
			if vim.wo.fdl == l then
				vim.wo.fdl = 99
			else
				vim.wo.fdl = l
			end
		end,
		{ silent = true, desc = 'Similar to <Tab>, but effect all paragraphs in same fold level.' },
	},

}

return M
