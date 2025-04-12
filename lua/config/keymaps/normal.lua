local window_util = require('utils.window')
local wk = require('which-key')

----------------------------------------------------------------------
--                             Windows                              --
----------------------------------------------------------------------
wk.add({
	{ '', group = 'Windows' },
	{ '<c-e>', '<c-w>k', desc = 'Jump to above window' },
	{ '<c-i>', '<c-w>l', desc = 'Jump to right window' },
	{ '<c-m>', '<c-w>h', desc = 'Jump to left window' },
	{ '<c-n>', '<c-w>j', desc = 'Jump to below window' },
	{ '<c-w><c-w>', '<c-w>p', desc = 'Jump to last window' },
})

wk.add({
	{ '', group = 'Split window' },
	{ '<a-m>', window_util.split_left, desc = 'Split left' },
	{ '<a-i>', window_util.split_right, desc = 'Split right' },
	{ '<a-n>', window_util.split_bottom, desc = 'Split bottom' },
	{ '<a-e>', window_util.split_top, desc = 'Split top' },
})

----------------------------------------------------------------------
--                             Editing                              --
----------------------------------------------------------------------
wk.add({
	{ '<C-q>', '<cmd>confirm q<cr>', desc = 'Close Window' },
	{ '<C-s-q>', '<cmd>tabclose<cr>', desc = 'Close Tab' },
	{ '<C-s>', '<cmd>silent w<cr>', desc = 'Save' },
	{ '<leader><cr>', 'a<cr><esc>', desc = 'Line Break' },
	{
		'<leader>ij',
		function()
			local ignore_list = { 'a', 'an', 'the', 'in', 'at' }
			local line = vim.api.nvim_get_current_line()
			local words = vim.split(line, ' ')

			local new_words = {}

			for _, word in ipairs(words) do
				if vim.tbl_contains(ignore_list, word) then
					table.insert(new_words, word)
					goto continue
				end
				local first_char = word:sub(1, 1)
				local rest = word:sub(2)

				table.insert(new_words, first_char:upper() .. rest)

				::continue::
			end

			local new_line = table.concat(new_words, ' ')
			vim.api.nvim_set_current_line(new_line)
		end,
		desc = 'Pascal Case',
	},
	{ '<leader>p', 'a <esc>p', desc = 'Paste After a Space' },
	{
		'[<leader>',
		function()
			local curr_line = vim.api.nvim_win_get_cursor(0)[1]
			local prev_line = curr_line - 1
			vim.api.nvim_buf_set_lines(0, prev_line, prev_line, true, { '' })
			vim.api.nvim_input('<up>')
		end,
		desc = 'Add line above',
	},
	{
		']<leader>',
		function()
			local curr_line = vim.api.nvim_win_get_cursor(0)[1]
			vim.api.nvim_buf_set_lines(0, curr_line, curr_line, true, { '' })
			vim.api.nvim_input('<down>')
		end,
		desc = 'Add line below',
	},
	{ 'x', '"_x', desc = 'Delete Character' },
})

----------------------------------------------------------------------
--                            Movements                             --
----------------------------------------------------------------------
wk.add({
	{ "''", '``zz', desc = 'Go to last jump point' },
	{ '0', '^', desc = 'Go to first character of line' },
	{ '<C-l>', '<C-i>zz', desc = 'Go to next jump point' },
	{ '<C-o>', '<C-o>zz', desc = 'Go to prev jump point' },
	{ '^', '0', desc = 'Go to start of line' },
})

----------------------------------------------------------------------
--                              Other                               --
----------------------------------------------------------------------
wk.add({
	{ '<leader><leader>o', '<cmd>messages<cr>', desc = 'Open messages window' },
})
