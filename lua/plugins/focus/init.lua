return {
	'nvim-focus/focus.nvim',
	version = false,
	opts = {
		enable = true,
		commands = false,
		autoresize = {
			enable = true,
			width = 100, -- Force width for the focused window
			height = 0, -- Force height for the focused window
			minwidth = 0, -- Force minimum width for the unfocused window
			minheight = 0, -- Force minimum height for the unfocused window
			height_quickfix = 10, -- Set the height of quickfix panel
		},
	},
}
