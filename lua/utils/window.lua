local M = {}

function M.split_left()
	local splitright = vim.o.splitright
	vim.o.splitright = false
	vim.api.nvim_cmd({ cmd = 'vs' }, {})
	vim.o.splitright = splitright
end

function M.split_right()
	local splitright = vim.o.splitright
	vim.o.splitright = true
	vim.api.nvim_cmd({ cmd = 'vs' }, {})
	vim.o.splitright = splitright
end

function M.split_top()
	local splitbelow = vim.o.splitbelow
	vim.o.splitbelow = false
	vim.api.nvim_cmd({ cmd = 'sp' }, {})
	vim.o.splitright = splitbelow
end

function M.split_bottom()
	local splitbelow = vim.o.splitbelow
	vim.o.splitbelow = true
	vim.api.nvim_cmd({ cmd = 'sp' }, {})
	vim.o.splitright = splitbelow
end

return M
