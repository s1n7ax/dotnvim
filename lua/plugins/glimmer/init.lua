-- shows animations on yank, delete, change, and undo etc.
return {
	'rachartier/tiny-glimmer.nvim',
	event = 'VeryLazy',
	opts = {
		enabled = true,

		-- Disable this if you wants to debug highlighting issues
		disable_warnings = true,

		default_animation = 'fade',
		refresh_interval_ms = 6,

		overwrite = {
			search = {
				enabled = true,
				default_animation = 'pulse',
			},
			paste = {
				enabled = true,
			},
			undo = {
				enabled = true,
			},
			redo = {
				enabled = true,
			},
		},

		support = {
			substitute = {
				enabled = true,
			},
		},
	},
}
