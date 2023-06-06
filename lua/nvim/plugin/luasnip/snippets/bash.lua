local M = {}

function M.setup()
	local ls = require('luasnip')
	local bash = require('snips.bash')

	local s = ls.s

	ls.add_snippets('bash', {
		s('set', bash.primitives.default_flags()),
	})
end

return M
