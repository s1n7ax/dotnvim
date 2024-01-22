local M = {}

function M.setup()
	local ls = require('luasnip')
	local lua = require('snips.lua')
	local common = require('snips.common')
	local s = ls.s
	local postfix = require('luasnip.extras.postfix').postfix

	ls.add_snippets('lua', {
		-- postfix
		postfix({
			trig = '.v',
			match_pattern = '[%w%.%_%-%(%)]+$',
		}, lua.postfix.variable()),
		postfix({
			trig = '.r',
			match_pattern = '[%w%.%_%-%(%)]+$',
		}, lua.postfix.returns()),

		-- choice & dynamic
		s('f', lua.choices.func()),
		s('fd', lua.choices.func_with_doc()),
		s('mod', lua.choices.module()),
		s('v', lua.dynamic.variable()),

		-- primitives
		s('faa', lua.primitives.anonymous_func()),
		s('fa', lua.primitives.noarg_anonymous_func()),
		s('i', lua.primitives.import()),
		s('o', lua.primitives.stdout()),
		s('r', common.primitives.returns()),
		s('oo', lua.primitives.pretty_print()),
		s('td', lua.primitives.test_desc()),
		s('ti', lua.primitives.test_it()),
	})
end

return M
