return {
	'rachartier/tiny-inline-diagnostic.nvim',
	event = 'VeryLazy',
	keys = {
		{
			']d',
			function()
				vim.diagnostic.jump({ float = false, count = 1 })
			end,
			desc = 'Next Diagnostic',
		},

		{
			'[d',
			function()
				vim.diagnostic.jump({ float = false, count = -1 })
			end,
			desc = 'Prev Diagnostic',
		},
	},
	opts = function(_, opts)
		vim.diagnostic.config({ virtual_text = false })
		return opts
	end,
}
