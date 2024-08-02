return {
	'nvim-neotest/neotest',
	optional = true,
	dependencies = { 'nvim-neotest/neotest-jest' },
	opts = function()
		return {
			adapters = {
				['neotest-jest'] = require('neotest-jest')({
					jestCommand = 'npm test --',
					env = { CI = true },
					cwd = function()
						return vim.fn.getcwd()
					end,
				}),
			},
		}
	end,
}
