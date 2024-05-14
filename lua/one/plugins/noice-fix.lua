local M = {}

local ns = vim.api.nvim_create_namespace('noice-fix')
-- message = {kind, content ,replace_last}
-- :h ui-messages
local messages = {}

local function repost()
	for _, msg in ipairs(messages) do
		local kind, contents, replace_last = unpack(msg)

		for _, content in ipairs(contents) do
			local attr_id, text = unpack(content)
			if text then
				if vim.tbl_contains({ '', 'echo', 'echomsg' }, kind) then
					vim.print(text)
				elseif kind == 'wmsg' then
					vim.notify(text, vim.log.levels.WARN)
				elseif vim.tbl_contains({ 'emsg', 'echoerr', 'lua_error', 'rpc_error' }, kind) then
					vim.notify(text, vim.log.levels.ERROR)
				end
			end
		end
	end
end

local function trigger()
	vim.ui_detach(ns)

	local ok, noiceConfig = pcall(require, 'noice.config')
	if (not ok) or (noiceConfig._running ~= true) then
		-- Only repost messages when noice.nvim is running
		return
	end

	repost()
end

M.setup = function()
	vim.ui_attach(ns, { ext_messages = true }, function(event, ...)
		-- :h ui-messages
		if event == 'msg_show' then
			table.insert(messages, { ... })
		end
	end)

	vim.schedule(trigger)
end

return M
