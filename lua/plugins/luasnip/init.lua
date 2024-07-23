local f = require('utils.file').is_pkg_dir

return {
	'L3MON4D3/LuaSnip',
	event = 'LazyFile',
	dependencies = {
		{
			's1n7ax/nvim-snips',
			dir = f('~/Workspace/nvim-snips'),
		},
		'nvim-treesitter/nvim-treesitter',
		{
			's1n7ax/nvim-ts-utils',
			dir = f('~/Workspace/nvim-ts-utils'),
		},
		{
			'hrsh7th/nvim-cmp',
			opts = {
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
			},
		},
	},
	config = function()
		local helper = require('plugins.luasnip.helper')

		helper.register_snippets()
		helper.register_keymaps()
	end,
}
