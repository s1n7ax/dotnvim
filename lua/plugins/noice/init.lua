return {
	'folke/noice.nvim',
	lazy = false,
	enabled = true,
	opts = {
		lsp = {
			progress = {
				enabled = true,
			},
			signature = {
				enabled = false,
			},
			hover = {
				enabled = false,
			},

			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				['vim.lsp.util.convert_input_to_markdown_lines'] = true,
				['vim.lsp.util.stylize_markdown'] = true,
				['cmp.entry.get_documentation'] = true,
			},
		},
		messages = {
			enabled = true,
		},
	},
	dependencies = {
		'MunifTanjim/nui.nvim',
		'rcarriga/nvim-notify',
	},
}
