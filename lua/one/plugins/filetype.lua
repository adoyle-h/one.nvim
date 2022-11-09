local M = { 'nathom/filetype.nvim', desc = 'filetype detection' }

function M.config(config)
	local conf = config.filetype

	---@diagnostic disable-next-line: different-requires, redundant-parameter
	require('filetype').setup(conf)
end

M.defaultConfig = {
	'filetype',
	{
		overrides = {

			-- Set the filetype based on file extension
			extensions = {
				-- *.cocoascript files set filetype javascript
				cocoascript = 'javascript',
				bats = 'sh',
			},

			-- Set the filetype based on filename
			literal = { bash_profile = 'sh', profile = 'sh' },

			complex = {
				-- Set the filetype of any full filename matching the regex to gitconfig
				['.*git/config'] = 'gitconfig',
				['Dockerfile*'] = 'dockerfile',
				['*.dockerfile'] = 'dockerfile',
			},

			-- shebang = {
			--   -- Set the filetype of files with a dash shebang to sh
			--   dash = "sh",
			-- },

			-- The same as the ones above except the keys map to functions
			-- function_extensions = {
			--   cpp = function()
			--     vim.bo.filetype = "cpp"
			--     -- Remove annoying indent jumping
			--     vim.bo.cinoptions = vim.bo.cinoptions .. "L0"
			--   end,

			--   jsx = function()
			--     vim.bo.filetype = "pdf"
			--     -- Open in PDF viewer (Skim.app) automatically
			--     vim.fn.jobstart(
			--       "open -a skim " .. '"' .. vim.fn.expand("%") .. '"'
			--     )
			--   end,
			-- },

			-- function_literal = {
			--   Brewfile = function()
			--     vim.cmd("syntax off")
			--   end,
			-- },

			-- function_complex = {
			--   ["*.math_notes/%w+"] = function()
			--     vim.cmd("iabbrev $ $$")
			--   end,
			-- },
		},

	},
}

return M
