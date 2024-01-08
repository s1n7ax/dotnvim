local M = {}

function M.is_pkg_dir(path)
	path = vim.fn.expand(path)

	if vim.fn.isdirectory(path) == 0 then
		return nil
	end

	return path
end

return M
