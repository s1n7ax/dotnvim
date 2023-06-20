local Lsp = require('nvim.utils.lsp')
local LspEventType = require('nvim.utils.lsp.event')

local M = {}
local util = require('lspconfig/util')

local path = util.path

function M.get_python_path(workspace)
	if vim.env.VIRTUAL_ENV then
		return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
	end

	for _, pattern in ipairs({ '*', '.*' }) do
		local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
		if match ~= '' then
			return path.join(path.dirname(match), 'bin', 'python')
		end
	end

	-- Fallback to system Python.
	return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

function M.setup()
	Lsp.add_listener(LspEventType.SERVER_SETUP, function(ls, conf)
		if ls == 'pyright' then
			conf:set_option('before_init', function(_, config)
				config.settings.python.pythonPath =
					M.get_python_path(vim.fn.getcwd())
			end)
		end
	end)
end

return M
