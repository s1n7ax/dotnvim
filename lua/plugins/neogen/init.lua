return {
	'danymat/neogen',
	optional = true,
	dependencies = 'nvim-treesitter/nvim-treesitter',
	keys = {
		{ '<leader>id', ':Neogen<cr>', desc = 'Generate Annotation' },
	},
	opts = {
		snippet_engine = 'luasnip',
	},
}
