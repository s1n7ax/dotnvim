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
	specs = {
		'saghen/blink.cmp',
		optional = true,
		dependencies = {},
		-- following disables the copilot source for blink
		opts = function(_, opts)
			return opts
		end,
	},
}
