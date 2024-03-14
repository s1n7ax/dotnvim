local M = {}

local existing_hi = vim.api.nvim_get_hl(0, { name = 'WinBar', link = false })

vim.api.nvim_set_hl(
	0,
	'WinBarContentModified',
	{ fg = '#b33434', bg = existing_hi.bg }
)

vim.api.nvim_set_hl(
	0,
	'WinBarPathModified',
	{ fg = '#b33434', bg = existing_hi.bg }
)

M.eval = function()
	local file_path = vim.api.nvim_eval_statusline('%f', {}).str
	local has_modified = vim.api.nvim_eval_statusline('%m', {}).str == '[+]'
	local modified_status = has_modified and '  ' or ''

	local winbar_path_hi = has_modified and 'WinBarPathModified' or 'WinBarPath'

	file_path = file_path:gsub('/', ' ➤ ')

	return '%#WinBarSeparator#'
		.. '%*'
		.. '%#'
		.. winbar_path_hi
		.. '#'
		.. file_path
		.. '%*'
		.. '%#WinBarContentModified#'
		.. modified_status
		.. '%*'
		.. '%#WinBarSeparator#'
		.. '%*'
end

return M
