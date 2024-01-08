local M = {}

M.eval = function()
	local file_path = vim.api.nvim_eval_statusline('%f', {}).str
	local modified = vim.api.nvim_eval_statusline('%m', {}).str == '[+]'
			and '  '
		or ''

	file_path = file_path:gsub('/', ' ➤ ')

	return '%#WinBarSeparator#'
		.. '%*'
		.. '%#WinBarContent#'
		.. file_path
		.. '%*'
		.. '%#WinBarContentModified#'
		.. modified
		.. '%*'
		.. '%#WinBarSeparator#'
		.. '%*'
end

return M
