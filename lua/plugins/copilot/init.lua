return {
	'zbirenbaum/copilot.lua',
	optional = true,
	enabled = true,
	opts = {
		suggestion = {
			enabled = true,
			auto_trigger = true,
			keymap = {
				accept = '<c-o>',
			},
		},
		panel = { enabled = false },
		filetypes = {
			markdown = true,
			help = true,
		},
	},
}
