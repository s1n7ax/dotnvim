local M = {}

function M.setup()
	local ls = require('luasnip')
	local bash = require('snips.bash')

	local s = ls.s

	ls.add_snippets('sh', {
		s('set', bash.primitives.default_flags()),
		s('f', bash.primitives.func()),
		s('v', bash.choices.variable()),
	})
end

return M
