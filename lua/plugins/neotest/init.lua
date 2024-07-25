return {
	'nvim-neotest/neotest',
	dependencies = { 'nvim-neotest/neotest-jest' },
	opts = function(_, opts)
		local adapters = vim.tbl_get(opts, 'adapters') or {}

		table.insert(
			adapters,
			require('neotest-jest')({
				jestCommand = 'npm test --',
				env = { CI = true },
				cwd = function()
					return vim.fn.getcwd()
				end,
			})
		)

		opts.adapters = adapters
	end,
}
