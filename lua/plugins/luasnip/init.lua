local f = require('utils.file').is_pkg_dir

return {
	'L3MON4D3/LuaSnip',
	event = 'LazyFile',
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
	specs = {
		{
			'saghen/blink.cmp',
			opts = function(_, opts)
				local ls = require('luasnip')

				return vim.tbl_deep_extend('force', opts, {
					keymap = {
						preset = 'enter',
						['<CR>'] = {
							'accept',
							function()
								if ls.jumpable(-1) then
									ls.jump(-1)
									return true
								else
									vim.schedule(function()
										vim.api.nvim_input('<m-o>')
									end)
								end
							end,
						},
					},
				})
			end,
		},
	},
}
