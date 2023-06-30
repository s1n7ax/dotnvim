return {
	'jose-elias-alvarez/null-ls.nvim',
	name = 'null-ls',
	dependencies = { 'mason-null-ls' },
	config = function()
		local null_ls = require('null-ls')

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		null_ls.setup({
			debug = true,
			sources = {
				-- formatters
				formatting.prettierd,
				formatting.stylua,
				formatting.autopep8,
				formatting.taplo,
				formatting.shfmt,
				formatting.deno_fmt,

				-- diagnostics
				diagnostics.luacheck,
				diagnostics.markdownlint,
				diagnostics.editorconfig_checker.with({
					command = 'editorconfig-checker',
				}),

				-- diagnostics
				-- diagnostics.cspell.with({
				-- filetypes = {
				-- 'lua',
				-- 'rust',
				-- 'javascript',
				-- 'typescript',
				-- 'reactjavascript',
				-- 'reacttypescript',
				-- 'python',
				-- },
				-- method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
				-- fallback_severity = vim.diagnostic.severity.HINT,
				-- severity = vim.diagnostic.severity.HINT,
				-- }),
			},
		})
	end,
}
