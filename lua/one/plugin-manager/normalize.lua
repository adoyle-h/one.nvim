local M = {}

function M.getId(repo)
	if type(repo) == 'string' then
		if #repo == 0 then error('Invalid value of repo. Cannot be empty string.') end
		return repo
	elseif repo == nil then
		local index = M.PM.index + 1
		M.PM.index = index
		return index
	else
		error('Invalid value of repo. Only nil or "string" can be repo name.')
	end
end

function M.getRepo(repo)
	if repo then
		if repo:match('/') then
			return repo
		else
			return nil
		end
	else
		return nil
	end
end

function M.normalizeOpts(repo, opts)
	local t = type(repo)

	if not opts then
		if t == 'string' then
			opts = { id = repo, repo = repo }
		elseif t == 'table' then
			opts = repo
			if opts.id then return opts end

			repo = table.remove(opts, 1)
			opts.id = M.getId(repo)
			opts.repo = M.getRepo(repo)
		else
			error(string.format('Invalid Plug Type: %s', t))
		end
	else
		if opts.id then return opts end

		opts.id = M.getId(repo)
		opts.repo = M.getRepo(repo)
	end

	return opts
end

return M
