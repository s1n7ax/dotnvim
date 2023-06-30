return {
	'jay-babu/mason-null-ls.nvim',
	name = 'mason-null-ls',
	dependencies = { 'mason' },
	config = {
		automatic_setup = true,
		ensure_installed = {
			-- formatters
			'prettierd',
			'stylua',
			'autopep8',
			'taplo',
			'shfmt',

			-- linters
			'luacheck',
			'markdownlint',
			'editorconfig-checker',

			-- debuggers
			'debugpy',
		},
	},
}
