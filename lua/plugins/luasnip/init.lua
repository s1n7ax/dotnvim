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
			opts = function()
				return {
					sources = {
						compat = {},
						default = { 'lsp', 'path', 'snippets', 'buffer' },
						cmdline = {},
					},
					keymap = {
						preset = 'none',
						['<c-n>'] = { 'select_next' },
						['<c-e>'] = { 'select_prev' },
						['<c-space>'] = { 'show' },
						['<c-l>'] = {
							'cancel',
							function()
								local ls = require('luasnip')

								if ls.choice_active() then
									vim.schedule(function()
										ls.change_choice(1)
									end)
									return true
								end
								return false
							end,
							'fallback',
						},
						['<cr>'] = {
							'accept',
							function()
								local ls = require('luasnip')

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
				}
			end,
		},
	},
}
