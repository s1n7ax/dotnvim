local ls = require('luasnip')

local languages = {
	'lua',
	'javascript',
	'javascriptreact',
	'yaml',
	'java',
	'rust',
}

local M = {}

function M.register_snippets()
	for _, language in pairs(languages) do
		require(string.format('nvim.plugin.luasnip.snippets.%s', language)).setup()
	end
end

function M.set_highlights()
	local Highlighter = require('nvim.utils.nvim.highlighting.highlighter')
	local HighlightGroups =
		require('nvim.utils.nvim.highlighting.highlight-groups')
	local ThemeManager = require('nvim.utils.nvim.theme.theme-manager')

	local theme = ThemeManager.get_theme()

	local highlighter = Highlighter:new():add(HighlightGroups({
		LuaSnipChoiseNode = { guifg = theme.bright.yellow },
		LuaSnipActiveNode = { guifg = theme.bright.green },
	}))

	highlighter:register_highlights()
end

function M.register_keymaps()
	local wk = require('which-key')

	wk.register({
		['<c-i>'] = { M.expand_or_jump('<c-i>'), '(Snippet) Expand or jump' },
		['<c-n>'] = { M.jump_prev('<c-n>'), '(Snippet) Jump prev placeholder' },
		['<c-l>'] = { M.change_choice('<c-l>'), '(Snippet) Change choice' },
	}, { mode = { 'i', 's' } })

	wk.register({
		['<leader><leader>tt'] = { M.refresh_snippets, '(Snippet) refresh' },
	})
end

function M.expand_or_jump(fallback_key)
	return function()
		if ls.expand_or_jumpable() then
			ls.expand_or_jump()
		else
			vim.api.nvim_input(fallback_key)
		end
	end
end

function M.jump_next(fallback_key)
	return function()
		if ls.jumpable(1) then
			ls.jump(1)
		else
			vim.api.nvim_input(fallback_key)
		end
	end
end

function M.jump_prev(fallback_key)
	return function()
		if ls.jumpable(-1) then
			ls.jump(-1)
		else
			vim.api.nvim_input(fallback_key)
		end
	end
end

function M.change_choice(fallback_key)
	return function()
		if ls.choice_active() then
			ls.change_choice(1)
		else
			vim.api.nvim_input(fallback_key)
		end
	end
end

function M.refresh_snippets()
	print('refreshing snippets')

	local module = require('nvim.utils.common.module')

	module.unload_package('ts-utils')
	module.unload_package('snips')
	module.unload_package('nvim.plugin.luasnip')

	ls.cleanup()

	M.register_snippets()

	-- just of testing snips
	module.unload_package('nvim.plugin.luasnip.demo')
	require('nvim.plugin.luasnip.demo')
end

return M
