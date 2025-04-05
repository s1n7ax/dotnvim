local logo = require('plugins.snacks.logo')

---@class snacks.dashboard.Config
local dashboard = {
	enabled = true,
	preset = {
		header = logo,
	},
}

return {
	'folke/snacks.nvim',
	optional = true,
	keys = {
		{
			',,',
			function()
				require('snacks').picker.smart()
			end,
			desc = 'Smart Find Files',
		},
	},
	opts = {
		dashboard = dashboard,
		bigfile = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		scope = { enabled = false },
		picker = {
			sources = {
				explorer = {
					win = {
						list = {
							keys = {
								['h'] = 'focus_input',
								['<c-c>'] = 'cancel',
							},
						},
					},
					auto_close = true,
					layout = {
						preset = 'select',
						layout = {
							width = 0.8,
							height = 0.8,
						},
					},
				},
			},

			win = {
				input = {
					keys = {
						['<c-n>'] = { 'list_down', mode = { 'i', 'n' } },
						['<c-e>'] = { 'list_up', mode = { 'i', 'n' } },
					},
				},
				list = {
					keys = {
						['n'] = 'list_down',
						['e'] = 'list_up',
						['<c-c>'] = 'cancel',
						['<c-q>'] = 'close',
						['h'] = 'focus_input',
					},
				},
				preview = {
					keys = {
						['<c-c>'] = 'cancel',
					},
				},
			},
		},
	},
}
