local printf = string.format

return {
	{
		name = 'ToggleLSP',
		-- The dettached LSP will reattach after refresh file,

		command = function()
			local buf = vim.api.nvim_get_current_buf()
			local ft = vim.o.ft
			local lspconfig = require('lspconfig')

			local clients = vim.lsp.get_active_clients({ bufnr = buf })

			local activeMap = {}
			local list = vim.tbl_map(function(client)
				activeMap[client.name] = true
				return { text = ' ' .. client.name, client = client }
			end, clients)

			local servers = lspconfig.util.available_servers()

			if not activeMap['null-ls'] then list[#list + 1] = { text = ' null-ls', server = 'null-ls' } end

			for _, serverName in pairs(servers) do
				if not activeMap[serverName] then
					local server = lspconfig[serverName]
					if (not server.filetypes) or vim.tbl_contains(server.filetypes, ft) then
						list[#list + 1] = { text = ' ' .. serverName, server = server }
					end
				end
			end

			return list
		end,

		onSubmit = function(selection)
			local buf = vim.api.nvim_get_current_buf()

			if selection.client then
				local clientId = selection.client.id
				vim.lsp.buf_detach_client(buf, clientId)
				vim.lsp.util.buf_clear_references(buf)
			else
				local server = selection.server

				if server == 'null-ls' then
					require('null-ls.client').try_add()
				else
					server.manager.try_add(buf)
				end
			end
		end,

		sorting_strategy = 'ascending',

		layout_config = {
			height = { 0.4, min = 10, max = 30 },
			width = { 0.3, min = 30, max = 120 },
			prompt_position = 'top', -- top or bottom
		},
	},

	{
		name = 'ToggleNullLSP',

		command = function()
			local nullLS = require('null-ls')
			local S = require('null-ls.sources')
			local sources = nullLS.get_sources()
			local ft = vim.o.ft
			local results = {}

			-- source structure
			-- {
			-- 	name = "lua_format"
			-- 	id = 5,
			-- 	filetypes = {
			-- 		lua = true
			-- 	},
			-- 	generator = {
			-- 		async = true,
			-- 		opts = {
			-- 			args = { "-i" },
			-- 			command = "lua-format",
			-- 			ignore_stderr = true,
			-- 			name = "lua_format",
			-- 			to_stdin = true
			-- 		},
			-- 		source_id = 5  [n 7/8]
			-- 	},
			-- 	methods = {
			-- 		NULL_LS_FORMATTING = true
			-- 	},
			-- }
			for _, src in pairs(sources) do
				if src.filetypes[ft] then
					local available = S.is_available(src, ft) and '' or ''
					local methods = vim.fn.join(vim.tbl_keys(src.methods), ',')
					table.insert(results,
						{ text = printf('%s %s (%s)', available, src.name, methods), src = src, ft = ft })
				end
			end

			return results
		end,

		onSubmit = function(item)
			local nullLS = require('null-ls')
			local src = item.src
			local S = require('null-ls.sources')

			if S.is_available(src, item.ft) then
				nullLS.disable({ id = src.id })
				vim.schedule(function()
					print(printf('NullLS "%s" disabled', src.name))
				end)
			else
				nullLS.enable({ id = src.id })
				vim.schedule(function()
					print(printf('NullLS "%s" enabled', src.name))
				end)
			end
		end,

		sorting_strategy = 'ascending',

		layout_config = {
			height = { 0.4, min = 10, max = 30 },
			width = { 0.5, min = 60, max = 120 },
			prompt_position = 'top', -- top or bottom
		},
	},
}
