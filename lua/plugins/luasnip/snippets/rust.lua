local M = {}

function M.setup()
	local ls = require('luasnip')
	local rust = require('snips.rust')
	local common = require('snips.common')

	local s = ls.s

	ls.add_snippets('rust', {
		s('o', rust.dynamic.stdout()),
		s('v', rust.primitives.variable()),
		s('r', common.primitives.returns()),
		s('vec', rust.primitives.vector_struct()),
	})
end

return M
