-- All fields defined in one/init.lua
local One = {}

-- Clear all plugins and cached files.
-- It will ask to confirm before deleting files.
function One.reset()
	local util = One.util
	local config = One.CM.config
	local PATH_SEPARATOR = One.consts.PATH_SEPARATOR

	local pmUse = config.pluginManager.use
	local pmConf = config.pluginManager[pmUse]

	local files = { --
		config.impatient.dist,
		config.impatient.chunks.path,
		config.impatient.modpaths.path,
	}

	if pmUse == 'vim-plug' then
		files[#files + 1] = pmConf.dist
		files[#files + 1] = pmConf.pluginDir
	elseif pmUse == 'packer' then
		files[#files + 1] = pmConf.packerFolder
		files[#files + 1] = pmConf.config.snapshot_path
		files[#files + 1] = pmConf.config.compile_path
		files[#files + 1] = pmConf.config.package_root .. PATH_SEPARATOR .. pmConf.config.plugin_package
	else
		error('Invalid config.pluginManager.use=' .. pmUse)
	end

	for _, path in pairs(files) do print(path) end

	local isDir = vim.fn.isdirectory
	local choice = vim.fn.confirm('Confirm to delete above files', '&Yes\n&No', 2)

	if choice == 1 then
		print('Yes')

		local ok, msg
		for _, path in pairs(files) do
			if isDir(path) == 1 then
				print('Deleting directory: ' .. path)
				ok, msg = pcall(util.rm, path)
				if not ok then
					print('Failed to delete directory. Reason: ' .. msg)
					break
				end
			else
				print('Deleting file: ' .. path)
				ok, msg = os.remove(path)
				if not ok then
					print('Failed to delete file. Reason: ' .. msg)
					break
				end
			end

		end

		if ok then
			print(
				'Success. Please restart nvim and reinitialize it. See https://github.com/adoyle-h/one.nvim#initialization')
		else
			print(
				'Please delete above files manually.\nAnd then restart nvim and reinitialize it. See https://github.com/adoyle-h/one.nvim#initialization')
		end
	else
		print('No')
	end
end

return One
