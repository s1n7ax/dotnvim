local tbl = require('utils.table')

local M = {}

function M.setup()
	local ls = require('luasnip')
	local common = require('snips.common')
	local js = require('snips.javascript')
	local ts = require('snips.typescript')
	local jsr = require('snips.typescriptreact')
	local sv = require('snips.svelte')

	local s = ls.s

	local common_snip = function()
		return {
			s('cls', js.primitives.class()),
			s('con', js.primitives.constructor()),
			s('r', common.primitives.returns()),
			s('des', js.primitives.describe()),
			s('tc', js.primitives.test()),
			s('exp', js.primitives.expect()),
			s('un', js.primitives.undefined()),
			s('if', js.primitives.if_cond()),
			s('ex', js.primitives.export()),
			s('as', js.primitives.async()),
			s('aw', js.primitives.await()),
			s('prom', js.primitives.new_promise()),

			s('fa', js.choices.anonymous_func()),
			s('o', js.choices.stdout()),

			s('f', js.dynamic.func()),
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
			s('ur', jsr.primitives.use_ref()),
		}

		return tbl.concat(ts_snip(), snips)
	end

	local svelte_snips = function()
		local snips = {
			s('scr', sv.primitives.script()),
		}

		return tbl.concat(ts_snip(), snips)
	end

	ls.add_snippets('javascript', js_snip())
	ls.add_snippets('typescript', ts_snip())

	ls.add_snippets('javascriptreact', jsx_snip())
	ls.add_snippets('typescriptreact', tsx_snip())

	ls.add_snippets('svelte', svelte_snips())
end

return M
