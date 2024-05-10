return {
	'nvimtools/none-ls.nvim',
	config = function()
		local null_ls = require('null-ls')

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.nixfmt,
				-- null_ls.builtins.completion.spell,
			},
		})
	end,
}
