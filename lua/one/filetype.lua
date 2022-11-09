local M = {}

local map = {}
M.map = map

function M.add(lang, callback)
	local list = map[lang]
	if not list then
		list = {}
		map[lang] = list
	end

	list[#list + 1] = callback
end

function M.setup()
	vim.api.nvim_create_autocmd('FileType', {
		callback = function(args)
			local list = map[args.match]

			if list then
				for _, callback in pairs(list) do --
					callback(args)
				end
			end
		end,
	})
end

return M
