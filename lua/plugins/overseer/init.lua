return {
	'stevearc/overseer.nvim',
	optional = true,
	opts = {
		task_list = {
			bindings = {
				['<C-q>'] = false,
				['<C-e>'] = false,
			},
		},
		task_launcher = {
			bindings = {
				i = {
					['<C-c>'] = false,
				},
			},
		},
		task_editor = {
			bindings = {
				i = {
					['<C-c>'] = false,
				},
			},
		},
	},
}
