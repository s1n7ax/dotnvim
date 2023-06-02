return {
	'lukas-reineke/indent-blankline.nvim',
	event = 'BufReadPost',
	enabled = false,
	config = function()
		local ThemeManager = require('nvim.utils.nvim.theme.theme-manager')
		local HighlightGroup =
			require('nvim.utils.nvim.highlighting.highlight-groups')
		local Highlighter = require('nvim.utils.nvim.highlighting.highlighter')

		local Theme = ThemeManager.get_theme()

		local group = HighlightGroup({
			IndentBlanklineIndent1 = { fg = Theme.normal.red },
			IndentBlanklineIndent2 = { fg = Theme.normal.green },
			IndentBlanklineIndent3 = { fg = Theme.normal.yellow },
			IndentBlanklineIndent4 = { fg = Theme.normal.blue },
			IndentBlanklineIndent5 = { fg = Theme.normal.magenta },
			IndentBlanklineIndent6 = { fg = Theme.normal.cyan },
		})

		Highlighter:new():add(group):register_highlights()

		require('indent_blankline').setup({
			space_char_blankline = ' ',
			char_highlight_list = {
				'IndentBlanklineIndent1',
				'IndentBlanklineIndent2',
				'IndentBlanklineIndent3',
				'IndentBlanklineIndent4',
				'IndentBlanklineIndent5',
				'IndentBlanklineIndent6',
			},
		})
	end,
}
