local M = {}

function M.setup()
	local ls = require('luasnip')
	local common = require('snips.common')
	local js = require('snips.javascript')
	local ts = require('snips.typescript')

	local s = ls.s
	local i = ls.insert_node

	local js_snippets = function()
		return {
			s('c', js.primitives.class()),
			s('con', js.primitives.constructor()),
			s('r', common.primitives.returns()),
			s('des', js.primitives.describe()),
			s('tc', js.primitives.test()),
			s('exp', js.primitives.expect()),

			s('fa', js.choices.anonymous_func()),

			s('v', js.choices.variable()),
			s('i', js.choices.stdout(), {
				stored = {
					value = i(1, 'value'),
				},
			}),

			s('f', js.dynamic.func(), {
				stored = {
					name = i(1, 'name'),
					param = i(1),
					body = i(1),
				},
			}),
		}
	end

	local ts_snippets = function()
		return {
			s('int', ts.primitives.interface()),
			s('enum', ts.primitives.enum()),

			s('v', ts.choices.variable()),
		}
	end

	ls.add_snippets('javascript', js_snippets())
	ls.add_snippets(
		'typescript',
		vim.tbl_extend('force', js_snippets(), ts_snippets())
	)

	ls.add_snippets('javascriptreact', js_snippets())
	ls.add_snippets(
		'typescriptreact',
		vim.tbl_extend('force', js_snippets(), ts_snippets())
	)
end

return M
