local M = {
	'table',
	requires = { 'dhruvasagar/vim-table-mode' },
	desc = 'format table',
	on = 'TableModeToggle',
}

M.defaultConfig = {
	{ 'table' },
	{
		motion_up_map = '[{',
		motion_down_map = ']}',
		motion_left_map = '[[',
		motion_right_map = ']]',
		map_prefix = '<leader>T',
	},
}

function M.config(config)
	local g = vim.g
	for key, value in pairs(config.table) do g['table_mode_' .. key] = value end
end

M.commands = {
	TableModeToggleGFM = function()
		local b = vim.b
		b.table_mode_corner = '|'
		b.table_mode_separator = '|'
		b.table_mode_fillchar = '-'
		b.table_mode_corner_corner = '|'
		b.table_mode_align_char = ':'

		vim.cmd.TableModeToggle()
	end,

	TableModeToggleNormal = function()
		local b = vim.b
		b.table_mode_corner = '+'
		b.table_mode_separator = '|'
		b.table_mode_fillchar = '-'
		b.table_mode_corner_corner = '+'
		b.table_mode_align_char = ':'

		vim.cmd.TableModeToggle()
	end,
}

return M
