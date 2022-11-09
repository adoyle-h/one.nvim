local S = {}
local items = {}

function S.new()
	return setmetatable({}, { __index = S })
end

function S:get_debug_name()
	return 'dynamic'
end

-- Executed after the item was selected.
-- @param item lsp.CompletionItem
-- @param callback fun(completion_item: lsp.CompletionItem|nil)
function S:execute(item, callback)
	callback(item)
end

-- Resolve completion item (optional). This is called right before the completion is about to be displayed.
-- Useful for setting the text shown in the documentation window (`completion_item.documentation`).
-- @param item lsp.CompletionItem
-- @param callback fun(completion_item: lsp.CompletionItem|nil)
function S:resolve(item, callback)
	local result = item.data.result

	if not result then
		result = item.callback(item)

		if item.cache then item.data.result = result end
	end

	item.insertText = result
	item.detail = result

	callback(item)
end

-- @param params cmp.SourceCompletionApiParams
-- @param callback fun(response: lsp.CompletionResponse|nil)
function S:complete(params, callback)
	callback(items)
end

-- @param name string
-- @param with additional "callback" funtion
function S.add(name, item)
	item.label = name
	item.data = {}
	if item.cache == nil then item.cache = false end
	items[#items + 1] = item
end

return S
