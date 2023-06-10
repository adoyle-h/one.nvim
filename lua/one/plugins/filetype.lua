local M = { 'filetype', desc = 'filetype detection' }

function M.config(config)
	vim.filetype.add(config.filetype)
end

M.defaultConfig = {
	'filetype',
	{
		-- see :h vim.filetype.add

		-- Set the filetype based on file extension
		extension = {
			-- *.cocoascript files set filetype javascript
			cocoascript = 'javascript',
			bats = 'sh',
		},

		-- Set the filetype based on filename
		filename = { bash_profile = 'sh', profile = 'sh' },

		pattern = {
			-- Set the filetype of any full filename matching the regex to gitconfig
			['.*git/config'] = 'gitconfig',
			['Dockerfile*'] = 'dockerfile',
			['*.dockerfile'] = 'dockerfile',
		},

	},
}

return M
