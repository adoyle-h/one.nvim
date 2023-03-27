return {
	'chentoast/marks.nvim',
	id = 'mark',

	config = function(config)
		require('marks').setup(config.mark)
	end,

	defaultConfig = {
		'mark',
		{
			-- whether to map keybinds or not. default true
			default_mappings = false,

			-- which builtin marks to show. default {}
			--[[ builtin_marks = { '.', '<', '>', '^' }, ]]

			-- whether movements cycle back to the beginning/end of buffer. default true
			cyclic = true,

			-- whether the shada file is updated after modifying uppercase marks. default false
			force_write_shada = true,

			-- how often (in ms) to redraw signs/recompute mark positions.
			-- higher values will have better performance but may cause visual lag,
			-- while lower values may cause performance penalties. default 150.
			refresh_interval = 250,

			-- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
			-- marks, and bookmarks.
			-- can be either a table with all/none of the keys, or a single number, in which case
			-- the priority applies to all marks.
			-- default 10.
			sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },

			excluded_filetypes = {},

			-- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
			-- sign/virttext. Bookmarks can be used to group together positions and quickly move
			-- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
			-- default virt_text is "".
			bookmark_0 = {
				sign = '⚑',
				-- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
				-- defaults to false.
				annotate = true,
			},

			mappings = {
				set_next = 'mm',
				set = 'm,',
				delete_line = 'md',
				delete_buf = 'mD',
				next = 'mj',
				prev = 'mk', -- pass false to disable only this default mapping
				set_bookmark0 = 'm0',
				set_bookmark1 = 'm1',
				set_bookmark2 = 'm2',
				set_bookmark3 = 'm3',
				set_bookmark4 = 'm4',
				set_bookmark5 = 'm5',
				set_bookmark6 = 'm6',
				set_bookmark7 = 'm7',
				set_bookmark8 = 'm8',
				set_bookmark9 = 'm9',
				delete_bookmark = 'mbd',
			},
		},
	},

	keymaps = {
		{
			'n',
			'ml',
			function()
				require('marks').mark_state:buffer_to_list('quickfixlist')

				local ok, trouble = pcall(require, 'trouble')
				if ok then
					trouble.open('quickfix')
				else
					vim.cmd.copen()
				end
			end,
		},

		{
			'n',
			'mL',
			function()
				require('marks').mark_state:all_to_list('quickfixlist')

				local ok, trouble = pcall(require, 'trouble')
				if ok then
					trouble.open('quickfix')
				else
					vim.cmd.copen()
				end
			end,
		},

		{
			'n',
			'mbl',
			function()
				require'marks'.bookmark_state:all_to_list('quickfixlist')

				local ok, trouble = pcall(require, 'trouble')
				if ok then
					trouble.open('quickfix')
				else
					vim.cmd.copen()
				end
			end,
		},
	},
}
