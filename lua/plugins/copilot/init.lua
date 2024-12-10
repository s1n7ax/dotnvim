return {
	'zbirenbaum/copilot.lua',
	optional = true,
	opts = {
		suggestion = {
			debounce = 200,
		},
	},
	specs = {
		{
			'nvim-cmp',
			optional = true,
			---@param opts cmp.ConfigSchema
			opts = function(_, opts)
				table.insert(opts.sources, 1, {
					name = 'copilot',
					group_index = 1,
					priority = 99,
					max_item_count = 1,
				})
			end,
		},
	},
}
