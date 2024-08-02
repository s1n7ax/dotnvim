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

---Following fixes the border issue in terminals
---@see https://www.reddit.com/r/neovim/comments/1ehidxy/you_can_remove_padding_around_neovim_instance/
vim.api.nvim_create_autocmd({ 'UIEnter', 'ColorScheme' }, {
	callback = function()
		local normal = vim.api.nvim_get_hl(0, { name = 'Normal' })
		if not normal.bg then
			return
		end
		io.write(string.format('\027]11;#%06x\027\\', normal.bg))
	end,
})

vim.api.nvim_create_autocmd('UILeave', {
	callback = function()
		io.write('\027]111\027\\')
	end,
})
