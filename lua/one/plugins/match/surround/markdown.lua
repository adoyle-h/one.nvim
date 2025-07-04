local M = {
	id = 'nvim-surround.markdown',
	filetypes = {},
}

M.filetypes.markdown = function(args)
	vim.keymap.set('v', '<M-b>', function()
		vim.api.nvim_feedkeys('2s*', 'x', false)
	end, { silent = true, desc = 'bold text', buffer = args.buf })

	vim.keymap.set({ 'n', 'v' }, '<M-B>', function()
		vim.api.nvim_feedkeys('2ds*', 'm', false)
	end, { silent = true, desc = 'unbold text', buffer = args.buf })

	require('nvim-surround').buffer_setup({
		surrounds = {
			-- Surround markdown link title, using clipboard contents.
			-- Copy from: https://github.com/kylechui/nvim-surround/discussions/53#discussioncomment-3134891
			['l'] = {
				add = function()
					local clipboard = vim.fn.getreg('+'):gsub('\n', '')
					return {
						{ '[' },
						{ '](' .. clipboard .. ')' },
					}
				end,
				find = '%b[]%b()',
				delete = '^(%[)().-(%]%b())()$',
				change = {
					target = '^()()%b[]%((.-)()%)$',
					replacement = function()
						local clipboard = vim.fn.getreg('+'):gsub('\n', '')
						return {
							{ '' },
							{ clipboard },
						}
					end,
				},
			},

			-- Surround markdown link title, using the text of the last delete or yank
			['L'] = {
				add = function()
					local clipboard = vim.fn.getreg('"'):gsub('\n', '')
					return {
						{ '[' },
						{ '](' .. clipboard .. ')' },
					}
				end,
				find = '%b[]%b()',
				delete = '^(%[)().-(%]%b())()$',
				change = {
					target = '^()()%b[]%((.-)()%)$',
					replacement = function()
						local clipboard = vim.fn.getreg('"'):gsub('\n', '')
						return {
							{ '' },
							{ clipboard },
						}
					end,
				},
			},
		},
	})
end

return M
