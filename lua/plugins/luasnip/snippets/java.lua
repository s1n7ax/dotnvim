local M = {}

function M.setup()
	local ls = require('luasnip')
	local java = require('snips.java')

	local s = ls.s

	ls.add_snippets('java', {
		s('o', java.primitives.stdout()),
		s('c', java.primitives.class()),
		s('main', java.primitives.main()),
		s('mainc', java.primitives.main_class()), -- generates a class with a main

		s('v', java.choices.variable()),
	})
end

return M
