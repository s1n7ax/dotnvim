return {
	'zbirenbaum/copilot.lua',
	optional = true,
	opts = {
		panel = { enabled = false },
		suggestion = {
			enabled = true,
			auto_trigger = false,
			hide_during_completion = true,
			debounce = 75,
			trigger_on_accept = true,
			keymap = {
				accept = '<C-o>',
				accept_word = false,
				accept_line = false,
				next = false,
				prev = false,
				dismiss = false,
			},
		},
	},
}
