local config = require('one.config').config

local M = {
	'nvim-lualine/lualine.nvim',
	desc = 'lualine.nvim',
	config = function()
		require('lualine').setup(config.statusline.lualine)
	end,
}

local printf = string.format

---@return string current mode name
local function getMode()
	local mode_code = vim.api.nvim_get_mode().mode
	return config.statusline.modeMap[mode_code] or mode_code
end

local function mixLine()
	local space_pat = [[\v^ +]]
	local tab_pat = [[\v^\t+]]
	local space_indent = vim.fn.search(space_pat, 'nwc')
	local tab_indent = vim.fn.search(tab_pat, 'nwc')
	local mixed = (space_indent > 0 and tab_indent > 0)
	local mixed_same_line
	if not mixed then
		mixed_same_line = vim.fn.search([[\v^(\t+ | +\t)]], 'nwc')
		mixed = mixed_same_line > 0
	end
	if not mixed then return '' end
	if mixed_same_line ~= nil and mixed_same_line > 0 then return 'MIX:' .. mixed_same_line end
	local space_indent_cnt = vim.fn.searchcount({ pattern = space_pat, max_count = 1e3 }).total
	local tab_indent_cnt = vim.fn.searchcount({ pattern = tab_pat, max_count = 1e3 }).total
	if space_indent_cnt > tab_indent_cnt then
		return 'MIX:' .. tab_indent
	else
		return 'MIX:' .. space_indent
	end
end

local function paste()
	if vim.o.paste then
		return config.statusline.pasteSymbol
	else
		return ''
	end
end

local function bufferNumber()
	return 'buf:' .. vim.api.nvim_get_current_buf()
end

local function location()
	local row, col = table.unpack(vim.api.nvim_win_get_cursor(0))
	local total = vim.api.nvim_buf_line_count(0)

	return printf('%s/%s %s', row, total, col)
end

local function spaces()
	return printf('ts:%s sw:%s', vim.o.tabstop, vim.o.shiftwidth)
end

local function my_sections(funcs)
	return function()
		local str = ''
		for _, func in pairs(funcs) do str = str .. ' ' .. func() end
		return str
	end
end

local function theme(colors)
	local black = colors.black
	local white = colors.white
	local green = colors.green
	local grey = colors.grey
	local sec_c_bg = colors.sec_c_bg

	return {
		normal = {
			a = { fg = black, bg = green, gui = 'bold' },
			b = { fg = white, bg = grey },
			c = { fg = colors.sec_c_fg, bg = sec_c_bg },
			x = { fg = colors.sec_c_fg, bg = colors.sec_x_bg },
			y = { fg = white, bg = colors.sec_y_bg },
			z = { fg = black, bg = green },
		},

		winbar = { c = { fg = colors.sec_c_fg, bg = 'green' } },

		insert = { a = { fg = black, bg = colors.blue, gui = 'bold' } },

		visual = { a = { fg = black, bg = colors.orange, gui = 'bold' } },

		replace = { a = { fg = black, bg = colors.purple, gui = 'bold' } },

		command = { a = { fg = black, bg = colors.yellow, gui = 'bold' } },

		inactive = {
			a = { fg = white, bg = grey, gui = 'bold' },
			b = { fg = white, bg = colors.sec_y_bg },
			c = { fg = white, bg = black },
		},
	}
end

local function setNoice(lualineConfig, c)
	local has_noice, noice = pcall(require, 'noice')
	if has_noice then
		local noiceStatus = noice.api.status

		table.insert(lualineConfig.winbar.lualine_x, {
			function()
				local message = require('noice.message.manager').get({ --
					event = 'msg_showmode',
				}, { count = 1, sort = true })[1]

				local str = vim.trim(message:content()):gsub('%%', '%%%%')

				if str:find('@') then
					return str
				else
					return ''
				end
			end,
			cond = noiceStatus.mode.has,
			color = { fg = '#ff9e64' },
		})

		table.insert(lualineConfig.winbar.lualine_x, {
			function()
				local message = require('noice.message.manager').get({ --
					event = 'msg_show',
					kind = 'search_count',
				}, { count = 1, sort = true })[1]

				return vim.trim(message:content()):gsub('%%', '%%%%'):gsub('%s*%[%d+/%d+%]$', '')
			end,
			icon = '',
			cond = noiceStatus.search.has,
			color = { fg = c.match.fg },
		})
	end

end

M.defaultConfig = function()
	local c = config.colors
	local colors = vim.tbl_extend('keep', vim.tbl_get(config, 'statusline', 'colors') or {}, {
		red = c.red,
		black = c.black,
		white = '#d9d7ce',
		grey = '#282b2e',
		green = '#bbe67e',
		blue = '#689afd',
		orange = '#D75F00',
		purple = '#765ADA',
		yellow = '#C7B000',
		cyan = '#9ac3de',
		sec_y_bg = '#272d38',
		sec_c_fg = '#607080',
		sec_c_bg = '#12151a',
		sec_x_bg = '#121A22',
	})

	local symbolMap = config.symbolMap

	local diagnosticBG = '#0D203A'
	local diagnostics = {
		'diagnostics',

		-- Table of diagnostic sources, available sources are:
		--   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
		-- or a function that returns a table as such:
		--   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
		sources = { 'nvim_diagnostic' },

		-- Displays diagnostics for the defined severity types
		sections = { 'error', 'warn', 'info', 'hint' },

		diagnostics_color = {
			-- Same values as the general color option can be used here.
			error = { fg = colors.red, bg = diagnosticBG },
			warn = { fg = colors.yellow, bg = diagnosticBG },
			info = { fg = colors.blue, bg = diagnosticBG },
			hint = { fg = colors.cyan, bg = diagnosticBG },
		},

		symbols = {
			error = symbolMap.ERROR .. ' ',
			warn = symbolMap.WARN .. ' ',
			info = symbolMap.INFO .. ' ',
			hint = symbolMap.HINT .. ' ',
		},

		colored = true, -- Displays diagnostics status in color if set to true.
		update_in_insert = false, -- Update diagnostics in insert mode.
		always_visible = false, -- Show diagnostics even if there are none.
	}

	local filename = {
		'filename',
		file_status = true, -- Displays file status (readonly status, modified status)
		newfile_status = true, -- Display new file status (new file means no write after created)
		path = 1, -- 0: Just the filename
		-- 1: Relative path
		-- 2: Absolute path
		-- 3: Absolute path, with tilde as the home directory

		shorting_target = 40, -- Shortens path to leave 40 spaces in the window

		-- for other components. (terrible name, any suggestions?)
		symbols = {
			modified = '[*]', -- Text to show when the file is modified.
			readonly = ' ' .. symbolMap.LOCK, -- Text to show when the file is non-modifiable or readonly.
			unnamed = '[No Name]', -- Text to show for unnamed buffers.
			newfile = '[New]', -- Text to show for new created file before first writting
		},
	}

	local aerial = {
		'aerial',

		sep = ' > ', -- The separator to be used to separate symbols in status line.

		-- The number of symbols to render top-down. In order to render only 'N' last
		-- symbols, negative numbers may be supplied. For instance, 'depth = -1' can
		-- be used in order to render only current symbol.
		depth = nil,

		-- When 'dense' mode is on, icons are not rendered near their symbols. Only
		-- a single icon that represents the kind of current symbol is rendered at
		-- the beginning of status line.
		dense = false,

		dense_sep = '.', -- The separator to be used to separate symbols in dense mode.

		colored = true, -- Color the symbol icons.

		color = { fg = colors.cyan, bg = '#0A1921', gui = 'bold' },
	}

	local progress = require('lualine.components.progress')

	local lualineConfig = {
		options = {
			icons_enabled = true,
			theme = theme(colors),
			-- component_separators = { left = '', right = '' },
			component_separators = { left = '│', right = '│' },
			section_separators = { left = '', right = '' },

			disabled_filetypes = {
				statusline = { 'alpha' },
				winbar = { 'alpha', 'aerial', 'neo-tree', 'nerdtree', 'NvimTree' },
			},

			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = true,

			-- how often lualine should refreash it's contents (in ms)
			refresh = { statusline = 5000, tabline = 0, winbar = 200 },
		},

		sections = {
			lualine_a = { getMode },
			lualine_b = { { 'branch', icon = symbolMap.BRANCH } },
			lualine_c = { filename },
			lualine_x = { my_sections({ progress, location, spaces, bufferNumber }), 'filesize' },
			lualine_y = { 'filetype' },
			lualine_z = { 'encoding', 'fileformat', mixLine, paste },
		},

		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},

		winbar = {
			lualine_a = { diagnostics },
			lualine_b = {},
			lualine_c = { aerial },
			lualine_x = {
				{ -- Let winbar always visible
					function()
						return ' '
					end,
					padding = 0,
				},
			},
			lualine_y = {},
			lualine_z = {},
		},
		inactive_winbar = {},

		tabline = {},
		extensions = {},
	}

	local has_navic, navic = pcall(require, 'nvim-navic')
	if has_navic then
		table.insert(lualineConfig.winbar.lualine_c, {
			navic.get_location,
			cond = navic.is_available,
			color = { fg = colors.cyan, bg = '#0A1921', gui = 'underline' },
		})
	end

	local has_auto_session, autoSessionLibrary = pcall(require, 'auto-session-library')
	if has_auto_session then
		table.insert(lualineConfig.sections.lualine_x, function()
			return printf('#%s', autoSessionLibrary.current_session_name())
		end)
	end

	setNoice(lualineConfig, c)

	return {
		'statusline',
		{
			colors = colors,

			pasteSymbol = 'Ƥ',

			modeMap = {
				['n'] = 'N', -- 'NORMAL'
				['no'] = 'O-PENDING',
				['nov'] = 'O-PENDING',
				['noV'] = 'O-PENDING',
				['no\22'] = 'O-PENDING',
				['niI'] = 'NORMAL',
				['niR'] = 'NORMAL',
				['niV'] = 'NORMAL',
				['nt'] = 'NORMAL',
				['ntT'] = 'NORMAL',
				['v'] = 'V', -- 'VISUAL'
				['vs'] = 'VISUAL',
				['V'] = 'V-LINE',
				['Vs'] = 'V-LINE',
				['\22'] = 'V-BLOCK',
				['\22s'] = 'V-BLOCK',
				['^V'] = 'V-BLOCK',
				['multi'] = 'Multi',
				['s'] = 'SELECT',
				['S'] = 'S-LINE',
				['\19'] = 'S-BLOCK',
				['i'] = 'I', -- 'INSERT',
				['ic'] = 'INSERT',
				['ix'] = 'INSERT',
				['R'] = 'R', -- 'REPLACE'
				['Rc'] = 'REPLACE',
				['Rx'] = 'REPLACE',
				['Rv'] = 'V-REPLACE',
				['Rvc'] = 'V-REPLACE',
				['Rvx'] = 'V-REPLACE',
				['c'] = 'C',
				['cv'] = 'EX',
				['ce'] = 'EX',
				['r'] = 'REPLACE',
				['rm'] = 'MORE',
				['r?'] = 'CONFIRM',
				['!'] = 'SHELL',
				['t'] = 'TERMINAL',
			},

			lualine = lualineConfig,
		},
	}
end

return M
