return {
	['ts-parsers'] = {
		desc = 'List nvim-treesitter parsers.  means installed.  is not. Press to install/update them.',

		command = function()
			local parsers = require('nvim-treesitter.parsers').available_parsers()
			local list = {}
			local api = vim.api

			for i, lang in pairs(parsers) do
				local installed = #api.nvim_get_runtime_file('parser/' .. lang .. '.so', false) > 0

				list[i] = {
					text = string.format('%s %s', installed and '' or '', lang),
					entry = { ordinal = lang },
					lang = lang,
					installed,
				}
			end

			return list
		end,

		onSubmit = function(items)
			if not vim.tbl_islist(items) then items = { items } end

			local toInstall = {}
			local toUpdate = {}

			for _, item in pairs(items) do
				if item.installed then
					toUpdate[#toUpdate + 1] = item.lang
				else
					toInstall[#toInstall + 1] = item.lang
				end
			end

			if #toInstall > 0 then vim.cmd.TSInstall(toInstall) end
			if #toUpdate > 0 then vim.cmd.TSUpdate(toUpdate) end
		end,
	},

	plugins = {
		desc = 'List one plugins',

		highlights = { tel_ext_i = { fg = '#51565C' }, tel_ext_plugin_desc = { fg = '#51565C' } },

		-- See :h telescope.pickers.entry_display
		format = { separator = ' ', items = { {}, {}, {} } },

		command = function()
			local one = require('one')
			local list = {}

			for i, plug in pairs(one.PM.plugs) do
				local id = tostring(plug.id)
				local desc = plug.desc

				list[#list + 1] = {
					id = id,
					text = {
						{ string.format('%3d', i), 'tel_ext_i' },
						id,
						{ desc and string.format('(%s)', desc) or '', 'tel_ext_plugin_desc' },
					},
					entry = { ordinal = id },
				}
			end

			return list
		end,

		onSubmit = function(item)
			if vim.tbl_islist(item) then error('Not support multiple selections') end

			local one = require('one')
			local path = one.PM.getPluginFolderPath(item.id)
			vim.cmd.tabnew(path)
		end,
	},

}
