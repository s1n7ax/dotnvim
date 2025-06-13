local root_files = {
	'tsconfig.base.json',
	'tsconfig.json',
	'jsconfig.json',
	'package.json',
	'.git',
}
local paths = vim.fs.find(root_files, { stop = vim.env.HOME })
local root_dir = vim.fs.dirname(paths[1])

-- root directory was not found
if root_dir == nil then
	return
end

---@type vim.lsp.Config
local M = {}

M.cmd = { 'tsgo', '--', 'lsp', '--stdio' }

M.filetypes = {
	'javascript',
	'javascriptreact',
	'javascript.jsx',
	'typescript',
	'typescriptreact',
	'typescript.tsx',
}

M.root_dir = root_dir

return M
