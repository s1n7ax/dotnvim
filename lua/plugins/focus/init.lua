return {
	'nvim-focus/focus.nvim',
	event = 'WinNew',
	version = '*',
	init = function()
		local ignore_filetypes = {
			'OverseerList',
			'dapui_scopes',
			'dapui_breakpoints',
			'dapui_stacks',
			'dap-repl',
			'dapui_console',
		}

		local group = vim.api.nvim_create_augroup('focus.nvim', { clear = true })

		vim.api.nvim_create_autocmd('FileType', {
			group = group,
			callback = function(_)
				if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
					vim.b.focus_disable = true
				else
					vim.b.focus_disable = false
				end
			end,
			desc = 'Disable focus autoresize for FileType',
		})
	end,
	opts = {
		enable = true,
		commands = true,
		autoresize = {
			enable = true,
			width = 100, -- Force width for the focused window
			height = 0, -- Force height for the focused window
			minwidth = 15, -- Force minimum width for the unfocused window
			minheight = 0, -- Force minimum height for the unfocused window
			height_quickfix = 10, -- Set the height of quickfix panel
		},
	},
}
