return {
	'rachartier/tiny-inline-diagnostic.nvim',
	event = 'LspAttach',
	opts = function(_, opts)
		vim.diagnostic.config({ virtual_text = false })
		return opts
	end,
}
