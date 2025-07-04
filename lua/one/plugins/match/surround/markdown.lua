return {
	id = 'nvim-surround.markdown',
	filetypes = {
		markdown = function()
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

					-- Surround markdown link title, using register contents.
					['L'] = {
						add = function()
							local clipboard = vim.fn.getreg('*'):gsub('\n', '')
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
				},
			})
		end,
	},
}
