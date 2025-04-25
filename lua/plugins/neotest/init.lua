return {
	'nvim-neotest/neotest',
	optional = true,
	dependencies = {
		'nvim-neotest/neotest-jest',
		'marilari88/neotest-vitest',
	},
	opts = function()
		return {
			adapters = {
				['neotest-jest'] = {},
				['neotest-vitest'] = {},
			},
		}
	end,
}
