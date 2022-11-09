local M = {
	'table',
	requires = { 'dhruvasagar/vim-table-mode' },
	desc = 'format table',
	on = 'TableModeToggle',
}

local function changeTableMode()
	local b = vim.b
	if (b.table_mode_mode == 'Normal') then
		b.table_mode_corner = '|'
		b.table_mode_separator = '|'
		b.table_mode_fillchar = '-'
		b.table_mode_corner_corner = '|'
		b.table_mode_align_char = ':'
		b.table_mode_mode = 'GFM'
	else
		b.table_mode_corner = '+'
		b.table_mode_separator = '|'
		b.table_mode_fillchar = '-'
		b.table_mode_corner_corner = '+'
		b.table_mode_align_char = ':'
		b.table_mode_mode = 'Normal'
	end

	print('Table Mode: ' .. b.table_mode_mode)
end

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
	local conf = config.table
	local g = vim.g
	g.table_mode_motion_up_map = conf.motion_up_map
	g.table_mode_motion_down_map = conf.motion_down_map
	g.table_mode_motion_left_map = conf.motion_left_map
	g.table_mode_motion_right_map = conf.motion_right_map
	g.table_mode_map_prefix = conf.map_prefix
end

M.keymaps = {
	{
		'n',
		'<leader>Tm',
		function()
			vim.b.table_mode_mode = 'GFM'
			vim.cmd.TableModeToggle()
		end,
		{ desc = 'Toggle TableMode' },
	},

	{ 'n', '<leader>Tc', changeTableMode, { desc = 'Change TableMode' } },
}

return M
