local util = require('one.util')

describe('util.superNum', function()
	it('Num <9', function()
		assert.equals('⁰', util.superNum(0))
		assert.equals('¹', util.superNum(1))
		assert.equals('²', util.superNum(2))
		assert.equals('³', util.superNum(3))
		assert.equals('⁴', util.superNum(4))
		assert.equals('⁵', util.superNum(5))
		assert.equals('⁶', util.superNum(6))
		assert.equals('⁷', util.superNum(7))
		assert.equals('⁸', util.superNum(8))
		assert.equals('⁹', util.superNum(9))
	end)

	it('Num >9', function()
		assert.equals('¹⁰', util.superNum(10))
		assert.equals('⁹⁹', util.superNum(99))
		assert.equals('¹²³', util.superNum(123))
		assert.equals('⁹⁹⁹', util.superNum(999))
	end)
end)

describe('util.subNum', function()
	it('Num <9', function()
		assert.equals('₀', util.subNum(0))
		assert.equals('₁', util.subNum(1))
		assert.equals('₂', util.subNum(2))
		assert.equals('₃', util.subNum(3))
		assert.equals('₄', util.subNum(4))
		assert.equals('₅', util.subNum(5))
		assert.equals('₆', util.subNum(6))
		assert.equals('₇', util.subNum(7))
		assert.equals('₈', util.subNum(8))
		assert.equals('₉', util.subNum(9))
	end)

	it('Num >9', function()
		assert.equals('₁₀', util.subNum(10))
		assert.equals('₉₉', util.subNum(99))
		assert.equals('₁₂₃', util.subNum(123))
		assert.equals('₉₉₉', util.subNum(999))
	end)
end)

describe('util.merge', function()
	it('(table, number)', function()
		local r = util.merge({ a = 1, c = 3 }, 2)
		assert.equals(2, r)
	end)

	it('(table, table)', function()
		local r = util.merge({ a = 1, c = 3 }, { b = 2, a = '4' })
		assert.are.same({ a = '4', b = 2, c = 3 }, r)
	end)

	it('(nil, table)', function()
		local r = util.merge(nil, { b = 2, a = '4' })
		assert.are.same({ a = '4', b = 2 }, r)
	end)

	it('(table, nil)', function()
		local r = util.merge({ a = 1, c = 3 }, nil)
		assert.are.same({ a = 1, c = 3 }, r)
	end)

	it('(array, array)', function()
		local r = util.merge({ 1, 3 }, { 2, '4' })
		assert.are.same({ 2, '4' }, r)
	end)

	it('(array, table)', function()
		local r = util.merge({ 1, 3 }, { b = 2, a = '4' })
		assert.are.same({ 1, 3, b = 2, a = '4' }, r)
	end)

	it('(PluginOpts, table)', function()
		local r = util.merge({ 'abc', a = 1, c = 3 }, { b = 2, a = '4' })
		assert.are.same({ 'abc', a = '4', b = 2, c = 3 }, r)
	end)

	it('(table, PluginOpts)', function()
		local r = util.merge({ a = 1, c = 3 }, { nil, b = 2, a = '4' })
		assert.are.same({ a = '4', b = 2, c = 3 }, r)
	end)

	it('nested tables', function()
		local r = util.merge({ a = { b = 2, c = { d = 4 } } }, { a = { b = 5 } })
		assert.are.same({ a = { b = 5, c = { d = 4 } } }, r)
	end)

	it('function override', function()
		local f1 = function()
			return 1
		end
		local f2 = function()
			return 2
		end
		local r = util.merge({ a = { b = { f = f1 } } }, { a = { b = { f = f2 } } })

		assert.equals(r.a.b.f, f2)
	end)

	it('({ a = { b = 1 } }, { a = {} })', function()
		local r = util.merge({ a = { b = 1 } }, { a = {} })
		assert.equals(r.a.b, 1)
	end)
end)

describe('util.pathJoin', function()
	local pathJoin = util.pathJoin

	it('"plugins"', function()
		assert.equals('/.local/share/nvim/plugins', pathJoin('/.local/share/nvim', 'plugins'))
	end)

	it('"lua/packer_compiled.lua"', function()
		assert.equals('/.local/share/nvim/lua/packer_compiled.lua',
			pathJoin('/.local', 'share', 'nvim', 'lua/packer_compiled.lua'))
	end)
end)

describe('util.dataPath', function()
	local home = vim.fs.normalize('~/')
	it('dataPath("")', function()
		assert.equals(home .. '.local/share/nvim/', util.dataPath())
	end)
end)

-- describe('util.ensureFile', function()
-- 	local tempDir = util.pathJoin('/tmp/nvim_test/util')
-- 	vim.loop.fs_rmdir(tempDir)
--
-- 	it('success', function()
-- 		local flag = util.ensureFile { --
-- 			url = 'http://google.com/',
-- 			dist = util.pathJoin(tempDir, 'google'),
-- 		}
-- 		assert.equals(false, flag)
-- 	end)
--
-- 	it('fail', function()
-- 		local flag = util.ensureFile { --
-- 			url = 'http:/abc.com',
-- 			dist = util.pathJoin(tempDir, 'abc'),
-- 		}
-- 		assert.equals(false, flag)
-- 	end)
-- end)
