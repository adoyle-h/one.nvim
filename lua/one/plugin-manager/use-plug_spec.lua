local usePlug = require('one.plugin-manager.use-plug')

describe('usePlug()', function()
	local plugs = {}
	local plugMap = {}
	local userPlugins = {}
	local g = { count = 0, plugs = plugs, plugMap = plugMap, userPlugins = userPlugins }
	local loadPlug = function()
	end

	usePlug(g, loadPlug, 'g/a')
	usePlug(g, loadPlug, 'g/b', { desc = 'b' })
	usePlug(g, loadPlug, { 'g/c', desc = 'c' })
	usePlug(g, loadPlug, { desc = 'd' })
	usePlug(g, loadPlug, { 'e', desc = 'e' })
	usePlug(g, loadPlug, { 'g/f', requires = {} })
	usePlug(g, loadPlug, { 'g/g', requires = { 'g/g1', { 'g/g2' } } })
	usePlug(g, loadPlug, { 'g/h', requires = { 'g/h1', { 'g/h2', disable = true } } })

	it('plugMap', function()
		assert.are.same({ id = 'g/a', repo = 'g/a' }, plugMap['g/a'])
	end)

	it('plugs', function()
		assert.are.same(12, #plugs)
		assert.are.same('g/a', plugs[1].repo)
		assert.are.same('g/b', plugs[2].repo)
		assert.are.same('g/c', plugs[3].repo)
		assert.are.same(nil, plugs[4].repo)
		assert.are.same(nil, plugs[5].repo)
		assert.are.same('g/f', plugs[6].repo)

		assert.are.same('g/g1', plugs[7].repo)
		assert.are.same('g/g2', plugs[8].repo)
		assert.are.same('g/g', plugs[9].repo)

		assert.are.same({ id = 'g/h1', repo = 'g/h1' }, plugs[10])

		assert.are.same({ id = 'g/h2', repo = 'g/h2', disable = true }, plugs[11])

		assert.are.same({
			id = 'g/h',
			repo = 'g/h',
			requires = { { id = 'g/h1', repo = 'g/h1' }, { id = 'g/h2', repo = 'g/h2', disable = true } },
		}, plugs[12])

	end)
end)
