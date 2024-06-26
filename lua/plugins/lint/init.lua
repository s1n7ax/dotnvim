return {
	'mfussenegger/nvim-lint',
	opts = {
		linters_by_ft = {
			javascript = { 'eslint_d' },
			typescript = { 'eslint_d' },
			javascriptreact = { 'eslint_d' },
			typescriptreact = { 'eslint_d' },
			lua = { 'luacheck' },
		},
	},
}
