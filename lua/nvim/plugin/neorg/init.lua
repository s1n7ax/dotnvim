return {
	'nvim-neorg/neorg',
	run = ':Neorg sync-parsers',
	event = 'VeryLazy',
	enabled = true,
	config = function()
		require('neorg').setup({
			load = {
				['core.defaults'] = {},
				['core.concealer'] = {},
				['core.completion'] = {
					config = {
						engine = 'nvim-cmp',
					},
				},
				['core.dirman'] = {
					config = {
						default_workspace = 'notes',
						workspaces = {
							notes = '~/Workspace/notes',
						},
					},
				},
			},
		})
	end,
}
