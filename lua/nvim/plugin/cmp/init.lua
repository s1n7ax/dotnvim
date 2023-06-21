return {
	'hrsh7th/nvim-cmp',
	name = 'cmp',
	dependencies = {
		-- CMP Sources
		'hrsh7th/cmp-nvim-lsp-signature-help',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-calc',
		'hrsh7th/cmp-cmdline',
		'f3fora/cmp-spell',
		'saadparwaiz1/cmp_luasnip',
		-- 'hrsh7th/cmp-emoji',
		's1n7ax/nvim-ts-utils',

		-- Other plugins
		'luasnip',
	},

	config = function()
		local cmp = require('cmp')
		local compare = require('cmp.config.compare')
		local types = require('cmp.types')
		local lspkind = require('lspkind')

		local WIDE_HEIGHT = 20

		cmp.setup({
			experimental = { ghost_text = true },

			mapping = cmp.mapping.preset.insert({
				['<C-e>'] = cmp.mapping.select_prev_item(),
				['<C-n>'] = cmp.mapping.select_next_item(),
				['<C-d>'] = cmp.mapping.scroll_docs(-4),
				['<C-u>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-l>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
			}),

			sorting = {
				comparators = {
					compare.recently_used,
					compare.kind,
					compare.exact,
					compare.locality,
				},
			},

			sources = {
				{
					name = 'nvim_lsp_signature_help',
					priority = 100,
					group_index = 1,
				},
				{
					name = 'nvim_lsp',
					priority = 100,
					group_index = 1,
				},
				{
					name = 'nvim_lua',
					priority = 100,
					group_index = 1,
				},
				{
					name = 'luasnip',
					priority = 90,
					group_index = 2,
				},
				{
					name = 'buffer',
					priority = 80,
					autocomplete = false,
					group_index = 3,
				},
				{
					name = 'path',
					priority = 80,
					group_index = 3,
				},
				{
					name = 'spell',
					priority = 50,
					group_index = 3,
				},
				{
					name = 'calc',
					priority = 50,
					group_index = 3,
				},
			},

			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},

			completion = {
				autocomplete = false,
				--  completeopt = 'menu,menuone,preview,noinsert',
			},

			confirmation = {
				default_behavior = types.cmp.ConfirmBehavior.Replace,
			},

			preselect = false,

			window = {
				completion = {
					scrollbar = '║',
					border = {
						'┌',
						'─',
						'┐',
						'│',
						'┘',
						'─',
						'└',
						'│',
					},
				},
				documentation = {
					border = {
						'┌',
						'─',
						'┐',
						'│',
						'┘',
						'─',
						'└',
						'│',
					},
					winhighlight = 'NormalFloat:NormalFloat,FloatBorder:NormalFloat',
					max_width = math.floor(WIDE_HEIGHT * (vim.o.columns / 100)),
					max_height = math.floor(WIDE_HEIGHT * (vim.o.lines / 100)),
				},
			},

			formatting = {
				format = lspkind.cmp_format({
					mode = 'symbol_text',
					menu = {
						buffer = '[Buffer]',
						nvim_lsp = '[LSP]',
						luasnip = '[LuaSnip]',
						nvim_lua = '[Lua]',
						latex_symbols = '[Latex]',
					},
				}),
			},
		})
	end,
}
