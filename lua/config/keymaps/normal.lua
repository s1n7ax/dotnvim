local window_util = require('utils.window')
local wk = require('which-key')

----------------------------------------------------------------------
--                             Windows                              --
----------------------------------------------------------------------
wk.register({
	name = 'Windows',

	['<c-w><c-w>'] = { '<c-w>p', 'Jump to last window' },
	['<c-m>'] = { '<c-w>h', 'Jump to left window' },
	['<c-i>'] = { '<c-w>l', 'Jump to right window' },
	['<c-n>'] = { '<c-w>j', 'Jump to below window' },
	['<c-e>'] = { '<c-w>k', 'Jump to above window' },
})

wk.register({
	name = 'Split window',
	m = { window_util.split_left, 'Split left' },
	n = { window_util.split_bottom, 'Split bottom' },
	e = { window_util.split_top, 'Split top' },
	i = { window_util.split_right, 'Split right' },
}, {
	prefix = '<tab>',
})
----------------------------------------------------------------------
--                             Editing                              --
----------------------------------------------------------------------
wk.register({
	['[<leader>'] = {
		function()
			local curr_line = vim.api.nvim_win_get_cursor(0)[1]
			local prev_line = curr_line - 1
			vim.api.nvim_buf_set_lines(0, prev_line, prev_line, true, { '' })
			vim.api.nvim_input('<up>')
		end,
		'Add line above',
	},
	[']<leader>'] = {
		function()
			local curr_line = vim.api.nvim_win_get_cursor(0)[1]
			vim.api.nvim_buf_set_lines(0, curr_line, curr_line, true, { '' })
			vim.api.nvim_input('<down>')
		end,
		'Add line below',
	},

	['<C-s>'] = { '<cmd>silent w<cr>', 'Save' },
	['<C-q>'] = { '<cmd>confirm q<cr>', 'Quit' },
	['<leader><cr>'] = { 'a<cr><esc>', 'Line Break' },
	['<leader>p'] = { 'a <esc>p', 'Paste After a Space' },
})

----------------------------------------------------------------------
--                            Movements                             --
----------------------------------------------------------------------
wk.register({
	["''"] = { '``zz', 'Go to last jump point' },
	['<C-o>'] = { '<C-o>zz', 'Go to prev jump point' },
	['<C-l>'] = { '<C-i>zz', 'Go to next jump point' },
	['0'] = { '^', 'Go to first character of line' },
	['^'] = { '0', 'Go to start of line' },
})

----------------------------------------------------------------------
--                               LSP                                --
----------------------------------------------------------------------
local is_inlay_hint_active = false

wk.register({
	a = {
		function()
			is_inlay_hint_active = not is_inlay_hint_active
			vim.lsp.buf.inlay_hint(0, is_inlay_hint_active)
		end,
		'Toggle Inlay Hint',
	},
}, {
	prefix = '<leader><leader>',
})

----------------------------------------------------------------------
--                              Other                               --
----------------------------------------------------------------------

wk.register({
	o = { '<cmd>messages<cr>', 'Open messages window' },
}, {
	prefix = '<leader><leader>',
})
