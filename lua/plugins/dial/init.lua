local function manupilate(direction, mode, group)
	return function()
		require('dial.map').manipulate(direction, mode, group)
	end
end

return {
	'monaqa/dial.nvim',
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

		local common_lang = {
			augend.constant.new({
				elements = { '&&', '||' },
				word = true,
				cyclic = true,
			}),
			augend.constant.new({
				elements = { 'and', 'or' },
				word = true,
				cyclic = true,
			}),
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
			augend.constant.new({
				elements = { 'const', 'let' },
				word = true,
				cyclic = true,
			}),
		}

		for _, v in ipairs(common) do
			table.insert(common_lang, v)
		end

		require('dial.config').augends:register_group({
			default = common,
		})

		local on_filetype = {}

		for _, lang in ipairs({
			'lua',
			'java',
			'javascript',
			'typescript',
			'rust',
			'python',
			'typescriptreact',
			'javascriptreact',
		}) do
			on_filetype[lang] = common_lang
		end

		on_filetype['markdown'] = {
			augend.misc.alias.markdown_header,
		}

		require('dial.config').augends:on_filetype(on_filetype)
	end,
}
