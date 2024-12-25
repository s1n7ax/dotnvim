local f = require('utils.file').is_pkg_dir

return {
	'L3MON4D3/LuaSnip',
	event = 'VeryLazy',
	optional = false,
	dependencies = {
		{
			's1n7ax/nvim-snips',
			dir = f('~/Workspace/my-projects/nvim-snips'),
		},
		'nvim-treesitter/nvim-treesitter',
		{
			's1n7ax/nvim-ts-utils',
			dir = f('~/Workspace/nvim-ts-utils'),
		},
	},
	config = function()
		local helper = require('plugins.luasnip.helper')
		helper.register_snippets()
		helper.register_keymaps()
	end,
}
