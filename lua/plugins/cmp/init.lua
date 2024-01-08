return {
	'hrsh7th/nvim-cmp',
	opts = function(_, opts)
		local cmp = require('cmp')

		opts.mapping = {
			['<C-e>'] = cmp.mapping.select_prev_item({
				behavior = cmp.SelectBehavior.Insert,
			}),
			['<C-n>'] = cmp.mapping.select_next_item({
				behavior = cmp.SelectBehavior.Insert,
			}),
			['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
			['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
			['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
			['<C-y>'] = cmp.config.disable,
			['<C-l>'] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			['<CR>'] = cmp.mapping.confirm({ select = false }),
		}

		opts.completion = {
			completeopt = 'menu,menuone',
		}

		return opts
	end,
}
