local list_util = require('utils.list')

return {
	'hrsh7th/nvim-cmp',
	event = 'VeryLazy',
	dependencies = {
		'onsails/lspkind.nvim',
		-- 'ray-x/cmp-sql',
	},
	opts = function(_, opts)
		local cmp = require('cmp')

		opts.experimental.ghost_text = false

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

		opts.formatting = {
			fields = { 'kind', 'abbr', 'menu' },
			format = function(entry, vim_item)
				local kind = require('lspkind').cmp_format({
					mode = 'symbol_text',
					maxwidth = 50,
				})(entry, vim_item)
				local strings = vim.split(kind.kind, '%s', { trimempty = true })
				kind.kind = ' ' .. (strings[1] or '') .. ' '
				kind.menu = '    ' .. (strings[2] or '')

				return kind
			end,
		}

		local custom_sources = {
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
				name = 'path',
				priority = 90,
				group_index = 1,
			},
			{
				name = 'luasnip',
				keyword_length = 3,
				max_item_count = 3,
				autocomplete = false,
				priority = 80,
				group_index = 3,
			},
			{
				name = 'spell',
				keyword_length = 3,
				max_item_count = 3,
				autocomplete = false,
				priority = 70,
				group_index = 3,
			},
			{
				name = 'buffer',
				keyword_length = 3,
				autocomplete = false,
				max_item_count = 3,
				priority = 50,
				group_index = 3,
			},
		}

		for i, source in ipairs(opts.sources) do
			local custom_source = list_util.find(
				custom_sources,
				function(custom_source)
					return custom_source.name == source.name
				end
			)

			if custom_source then
				opts.sources[i] = vim.tbl_deep_extend('force', source, custom_source)
			end
		end

		return opts
	end,
}
