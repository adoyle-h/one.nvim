return {

	'gsuuon/tshjkl.nvim',

	config = function(config)
		require('tshjkl').setup(config.tshjkl)
	end,

	highlights = function(config)
		local c = config.colors
		return { --
			TSHJKL_parent = { underline = true, bold = true, fg = c.black, bg = c.green },
			TSHJKL_child = { underline = true, bold = true, fg = c.black, bg = c.green },
			TSHJKL_next = { underline = true, bold = true, fg = c.black, bg = c.red },
			TSHJKL_prev = { underline = true, bold = true, fg = c.black, bg = c.red },
		}
	end,

	defaultConfig = { 'tshjkl', {
		-- false to highlight only. Note that enabling this will hide the highlighting of child nodes
		select_current_node = true,
		keymaps = {
			toggle = '<M-v>',
		},
		marks = {
			parent = {
				virt_text = { { 'h', 'TSHJKL_parent' } },
				virt_text_pos = 'overlay',
			},
			child = {
				virt_text = { { 'l', 'TSHJKL_child' } },
				virt_text_pos = 'overlay',
			},
			prev = {
				virt_text = { { 'k', 'TSHJKL_prev' } },
				virt_text_pos = 'overlay',
			},
			next = {
				virt_text = { { 'j', 'TSHJKL_next' } },
				virt_text_pos = 'overlay',
			},
		},
		binds = function(bind, tshjkl)
			bind('<Esc>', function()
				tshjkl.exit(true)
			end)

			bind('q', function()
				tshjkl.exit(true)
			end)

			bind('t', function()
				print(tshjkl.current_node():type())
			end)
		end,
	} },
}
