local config = require('one.config').config
local superNum = require('one.util').superNum
-- local subNum = require('one.util').subNum

local getBufOpt = vim.api.nvim_buf_get_option

local function filterWin(win)
	local buf = win.buf and win.buf().id or win
	local ft = getBufOpt(buf, 'ft')
	return not vim.tbl_contains(config.tabby.excludeFileTypes, ft)
end

local function renderWin(win)
	local hl, pre
	local preSym = '▌' -- '▋', '▌', '▍', '▎' '▏'

	if win.is_current() then
		hl = 'TabLineWinCur'
		pre = { preSym .. ' ', hl = 'TabLineWinSepCur' }
	else
		hl = 'TabLineWin'
		pre = { preSym .. ' ', hl = 'TabLineWinSep' }
	end

	local buf = win.buf().id
	local isModified = vim.api.nvim_buf_get_option(buf, 'modified')
	local icon = win.file_icon()
	if icon then
		icon = icon .. ' '
	else
		icon = ''
	end

	return { --
		pre,
		icon,
		win.buf_name(),
		{
			isModified and '* ' or '  ',
			hl = win.is_current() and 'TabLineBufCurModified' or 'TabLineBufModified',
		},
		hl = hl,
	}
end

local function renderTab(tab)
	local list

	local wins = tab.wins().wins
	wins = vim.tbl_filter(filterWin, wins)
	local winSum = superNum(#wins)

	if tab.is_current() then
		local sepHL = 'TabLineTabSepCur'

		list = {
			{ '', hl = sepHL },
			string.format('%s%s', tab.number(), winSum),
			{ '', hl = sepHL },
			hl = 'TabLineTabCur',
		}

		if config.tabby.showTabClose then
			table.insert(list, 3, tab.close_btn(''))
			table.insert(list, 3, ' ')
		end
	else
		list = { string.format(' %s%s ', tab.number(), winSum), hl = 'TabLineTab' }
	end

	return list
end

return {
	'nanozuki/tabby.nvim',

	highlights = function()
		local c = config.colors
		local bg = '#11151A'
		local curBG = '#1b2430'

		return {
			TabLineWinCur = { fg = c.blue, bg = curBG },
			TabLineWin = { fg = c.grey, bg = bg },
			TabLineWinSepCur = { fg = c.blue, bg = curBG },
			TabLineWinSep = { fg = c.black, bg = bg },
			TabLineTab = { fg = c.purple, bg = bg },
			TabLineTabCur = { fg = bg, bg = c.purple },
			TabLineTabSepCur = { fg = c.purple, bg = bg },
			TabLineBG = { bg = bg },
			TabLineBufCurModified = { fg = c.yellow, bg = curBG },
			TabLineBufModified = { fg = c.yellow, bg = bg },
		}
	end,

	config = function()
		local conf = config.tabby

		if conf.alwaysShow then vim.o.showtabline = 2 end

		local lines = function(line)
			local sections = {
				line.wins_in_tab(line.api.get_current_tab(), filterWin).foreach(renderWin),
				line.spacer(),
				line.tabs().foreach(renderTab),
				hl = 'TabLineBG',
			}

			return sections
		end

		require('tabby.tabline').set(lines)
	end,

	defaultConfig = {
		'tabby',
		{ --
			alwaysShow = true,
			showTabClose = false,
			excludeFileTypes = config.ignore.fileTypesForSomePlugs,
		},
	},
}
