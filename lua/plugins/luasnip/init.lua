local f = require('utils.file').is_pkg_dir

return {
	'L3MON4D3/LuaSnip',
	dependencies = {
		'snips',
		{
			'nvim-treesitter/nvim-treesitter',
			dir = f('~/Workspace/nvim-ts-utils'),
		},
		's1n7ax/nvim-ts-utils',
	},
	config = function()
		local helper = require('plugins.luasnip.helper')

		helper.register_snippets()
		helper.register_keymaps()
	end,
}
