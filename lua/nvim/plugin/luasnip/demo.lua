local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local r = ls.restore_node
local t = ls.text_node
local c = ls.choice_node

local fmt = require('luasnip.extras.fmt').fmt

local func1 = [[local {} = function()
end]]

local func2 = [[local function {}()
end]]

ls.add_snippets('lua', {
	s(
		'ii',
		c(1, {
			fmt(func1, {
				r(1, 'func_name'),
			}),
			fmt(func2, {
				r(1, 'func_name'),
			}),
		}),
		{
			stored = {
				func_name = i(nil, 'this_is_default'),
			},
		}
	),
})
