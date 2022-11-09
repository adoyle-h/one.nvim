local M = require('one.plugin-manager.plug')

describe('mergePlugDefaultConfi()', function()
	local mergePlugConfig = M.mergePlugDefaultConfig

	it('"a"', function()
		local plugDefaultConfig = { defaultConfig = { 'a', { hello = 'world' } } }
		local src = {}
		mergePlugConfig(src, plugDefaultConfig)
		assert.are.same({ a = { hello = 'world' } }, src)
	end)

	it('{"a"}', function()
		local plugDefaultConfig = { defaultConfig = { { 'a' }, { hello = 'world' } } }
		local src = {}
		mergePlugConfig(src, plugDefaultConfig)
		assert.are.same({ a = { hello = 'world' } }, src)
	end)

	it('{"a", "b"}', function()
		local plugDefaultConfig = { defaultConfig = { { 'a', 'b' }, { hello = 'world' } } }
		local src = {}
		mergePlugConfig(src, plugDefaultConfig)
		assert.are.same({ a = { b = { hello = 'world' } } }, src)
	end)
end)
