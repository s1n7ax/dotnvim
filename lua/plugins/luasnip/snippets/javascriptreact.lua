local M = {}

function M.setup()
	local ls = require('luasnip')
	local jsr = require('snips.javascriptreact')

	local s = ls.s

	local snippets = function()
		return {
			s('c', jsr.primitives.component()),
			s('hs', jsr.primitives.use_state()),
			s('he', jsr.primitives.use_effect()),
		}
	end

	ls.add_snippets('javascriptreact', snippets())
	ls.add_snippets('typescriptreact', snippets())
end

return M
