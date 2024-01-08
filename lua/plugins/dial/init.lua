local function manupilate(direction, mode, group)
	return function()
		require('dial.map').manipulate(direction, mode, group)
	end
end

local function concat_table(t1, t2)
	for i = 1, #t2 do
		t1[#t1 + 1] = t2[i]
	end
	return t1
end

return {
	'monaqa/dial.nvim',
	event = 'VeryLazy',
	keys = {
		{
			'<C-a>',
			manupilate('increment', 'normal'),
			desc = 'Increment',
			mode = 'n',
		},
		{
			'<c-x>',
			manupilate('decrement', 'normal'),
			desc = 'Decrement',
			mode = 'n',
		},
		{
			'g<C-a>',
			manupilate('increment', 'gnormal'),
			desc = 'Increment',
			mode = 'n',
		},
		{
			'g<C-x>',
			manupilate('decrement', 'gnormal'),
			desc = 'Decrement',
			mode = 'n',
		},

		{
			'<C-a>',
			manupilate('increment', 'visual'),
			desc = 'Visual Increment',
			mode = 'v',
		},
		{
			'<C-x>',
			manupilate('decrement', 'visual'),
			desc = 'Visual Decrement',
			mode = 'v',
		},
		{
			'g<C-a>',
			manupilate('increment', 'gvisual'),
			desc = 'Visual Increment',
			mode = 'v',
		},
		{
			'g<C-x>',
			manupilate('decrement', 'gvisual'),
			desc = 'Visual Decrement',
			mode = 'v',
		},
	},
	config = function()
		local augend = require('dial.augend')

		local common = {
			augend.integer.alias.decimal,
			augend.integer.alias.hex,
			augend.constant.alias.bool,
			augend.date.alias['%Y/%m/%d'],
			augend.date.alias['%d/%m/%Y'],
		}

		local lua = concat_table(common, {
			augend.constant.new({
				elements = { 'and', 'or' },
				word = true,
				cyclic = true,
			}),
		})

		local java = concat_table(common, {
			augend.constant.new({
				elements = { 'private', 'public', 'protected' },
				word = true,
				cyclic = true,
			}),
			augend.constant.new({
				elements = { 'class', 'interface', 'enum' },
				word = true,
				cyclic = true,
			}),
		})

		require('dial.config').augends:register_group({
			default = common,
		})

		require('dial.config').augends:on_filetype({
			lua,
			java = java,
		})
	end,
}
