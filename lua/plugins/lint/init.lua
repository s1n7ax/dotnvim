return {
	'mfussenegger/nvim-lint',
	event = 'VeryLazy',
	opts = {
		linters_by_ft = {
			lua = { 'luacheck' },
		},
	},
}
