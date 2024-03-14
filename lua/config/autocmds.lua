-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd('BufWinEnter', {
	pattern = '*',
	callback = function()
		-- skip if a pop up window
		if vim.fn.win_gettype() == 'popup' then
			return
		end

		-- skip if new buffer
		if vim.bo.filetype == '' then
			return
		end

		vim.wo.winbar = "%{%v:lua.require'utils.nvim.winbar'.eval()%}"
	end,
	group = vim.api.nvim_create_augroup('WinBar', {}),
})
