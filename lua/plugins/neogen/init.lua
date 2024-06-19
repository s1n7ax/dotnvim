return {
	'danymat/neogen',
	dependencies = 'nvim-treesitter/nvim-treesitter',
	keys = {
		{ '<leader>id', ':Neogen<cr>', desc = 'Generate Annotation' },
	},
	opts = {
		snippet_engine = 'luasnip',
	},
}
