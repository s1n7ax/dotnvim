local f = require('utils.file').is_pkg_dir

return {
	'L3MON4D3/LuaSnip',
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
	specs = {
		{
			'saghen/blink.cmp',
			opts = {
				keymap = {
					['<cr>'] = {
						function(cmp)
							local ls = require('luasnip')

							if cmp.is_visible() then
								return cmp.select_and_accept()
							end

							if ls.jumpable(-1) then
								vim.schedule(function()
									ls.jump(-1)
								end)

								return true
							end

							return false
						end,
						'fallback',
					},
				},
				snippets = {
					expand = function(snippet)
						require('luasnip').lsp_expand(snippet)
					end,
					active = function(filter)
						if filter and filter.direction then
							return require('luasnip').jumpable(filter.direction)
						end
						return require('luasnip').in_snippet()
					end,
					jump = function(direction)
						require('luasnip').jump(direction)
					end,
				},
			},
		},
	},
}
