local CM = require('one.config')

describe('CM.config', function()
	it('CM.setup()', function()
		CM.setup({
			colorcolumn = { 80, 100 },

			proxy = { github = 'https://ghp.ci/' },

			noneLS = {
				sources = function(builtins)
					return { builtins.formatting.stylua, builtins.completion.spell }
				end,
			},

			['mason-installer'] = { ensureInstalled = { 'css-lsp', 'yamlfmt' } },
		})

		local config = CM.config

		assert.are.same(config.proxy, { github = 'https://ghp.ci/' })
		assert.are.same(config['mason-installer'].ensureInstalled, { 'css-lsp', 'yamlfmt' })

		local null_ls = require('null-ls')
		local builtins = null_ls.builtins
		local sources = config.noneLS.sources(builtins) or {}

		assert.are.same(sources, {
			builtins.formatting.stylua, builtins.completion.spell,
		})
	end)
end)
