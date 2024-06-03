local tbl = require('utils.table')

local M = {}

function M.setup()
	local ls = require('luasnip')
	local common = require('snips.common')
	local js = require('snips.javascript')
	local ts = require('snips.typescript')
	local jsr = require('snips.javascriptreact')

	local s = ls.s
	local i = ls.insert_node

	local common_snip = function()
		return {
			s('cls', js.primitives.class()),
			s('con', js.primitives.constructor()),
			s('r', common.primitives.returns()),
			s('des', js.primitives.describe()),
			s('tc', js.primitives.test()),
			s('exp', js.primitives.expect()),

			s('fa', js.choices.anonymous_func()),

			s('o', js.choices.stdout(), {
				stored = {
					value = i(1, 'value'),
				},
			}),

			s('fun', js.dynamic.func(), {
				stored = {
					name = i(1, 'name'),
					param = i(1),
					body = i(1),
				},
			}),
		}
	end

	local js_snip = function()
		local snips = {
			s('v', js.choices.variable()),
		}

		return tbl.concat(common_snip(), snips)
	end

	local ts_snip = function()
		local snips = {
			s('int', ts.primitives.interface()),
			s('enum', ts.primitives.enum()),
			s('v', ts.choices.variable()),
		}

		return tbl.concat(common_snip(), snips)
	end

	local jsx_snip = function()
		local snips = {
			s('cmp', jsr.dynamic.component()),

			s('us', jsr.primitives.use_state()),
			s('ue', jsr.primitives.use_effect()),
		}

		return tbl.concat(js_snip(), snips)
	end

	local tsx_snip = function()
		local snips = {
			s('prop', jsr.dynamic.component_props()),
			s('cmp', jsr.dynamic.component()),

			s('us', jsr.primitives.use_state()),
			s('ue', jsr.primitives.use_effect()),
		}

		return tbl.concat(ts_snip(), snips)
	end

	ls.add_snippets('javascript', js_snip())
	ls.add_snippets('typescript', ts_snip())

	ls.add_snippets('javascriptreact', jsx_snip())
	ls.add_snippets('typescriptreact', tsx_snip())
end

return M
