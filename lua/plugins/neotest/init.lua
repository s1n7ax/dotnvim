return {
	'nvim-neotest/neotest',
	dependencies = { 'nvim-neotest/neotest-jest' },
	opts = function(_, opts)
		return vim.tbl_deep_extend('force', opts, {
			adapters = {
				require('neotest-jest')({
					jestCommand = 'npm test --',
					env = { CI = true },
					cwd = function()
						return vim.fn.getcwd()
					end,
				}),
			},
		})
	end,
}
