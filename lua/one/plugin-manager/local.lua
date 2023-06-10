local util = require('one.util')

local P = {}

P.cmds = { install = ':echo install is not supported<CR>', status = ':echo WIP<CR>' }

-- @param params see lua/one/plugin-manager/init.lua
function P.setup(params)
	local isNew = false

	vim.keymap.set('n', '<SPACE>P', P.cmds.status, { desc = 'Show Plugin Status' })

	local pluginDir = params.config.pluginManager['local'].pluginDir .. '/'
	P.pluginDir = pluginDir

	P.loadPlug = function(repo, opts)
		local repoName = string.sub(repo, string.find(repo, '/') + 1)
		vim.opt.rtp:prepend{ pluginDir .. repoName }
	end

	params.loadPlugs()
	params.run(isNew)

	return isNew
end

function P.getPluginFolderPath(folderName)
	return util.pathJoin(P.pluginDir, folderName)
end

return P
