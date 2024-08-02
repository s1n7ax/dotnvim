local f = require('utils.file').is_pkg_dir

return {
	'nvim-neotest/neotest',
	optional = true,
	dependencies = {
		'nvim-neotest/neotest-jest',
		{
			'nvim-java/neotest-jdtls',
			dir = f('~/Workspace/neotest-jdtls'),
		},
	},
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
				['neotest-jdtls'] = function()
					return require('neotest-jdtls')
				end,
			},
		}
	end,
}
