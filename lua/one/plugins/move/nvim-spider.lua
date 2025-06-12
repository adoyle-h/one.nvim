return {
	'chrisgrieser/nvim-spider',

	config = function(config)
		require('spider').setup(config.spider)
	end,

	defaultConfig = { 'spider', {
		skipInsignificantPunctuation = true,
		consistentOperatorPending = false, -- see "Consistent Operator-pending Mode" in the README
		subwordMovement = true,
		customPatterns = {}, -- check "Custom Movement Patterns" in the README for details
	} },

	keymaps = function()
		local spider = require('spider')
		return {
			{ '', 'w', function() spider.motion('w') end, { silent = true } },
			{ '', 'e', function() spider.motion('e') end, { silent = true } },
			{ '', 'b', function() spider.motion('b') end, { silent = true } },
		}
	end,
}
