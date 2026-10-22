local CM = require('one.config')
local util = require('one.util')

describe('proxyGithub config', function()
	it('restores direct GitHub URLs after clearing the proxy', function()
		local github = 'https://github.com/example/repository'
		CM.setup({ proxy = { github = 'https://proxy.example' } })
		assert.are.equal('https://proxy.example/' .. github, util.proxyGithub(github))

		CM.setup({})
		assert.are.equal(github, util.proxyGithub(github))
	end)
end)
