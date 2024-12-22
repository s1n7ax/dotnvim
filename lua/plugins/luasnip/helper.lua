local ls = require('luasnip')
local wk = require('which-key')
local config = require('plugins.luasnip.config')

local M = {}

function M.register_snippets()
	for _, language in ipairs(config.languages) do
		local module_path = string.format('plugins.luasnip.snippets.%s', language)

		local ok, snip = pcall(require, module_path)

		if ok then
			snip.setup()
		end
	end
end

function M.register_keymaps()
	wk.add({
		{
			mode = { 'i', 's' },
			{
				'<c-i>',
				M.expand_or_jump('<tab>'),
				desc = '(Snippet) Expand or jump',
				expr = true,
			},
		},
	})

	wk.add({
		{ '<leader>w', M.refresh_snips, desc = '(Snippet) refresh' },
	})
end

function M.expand_or_jump(fallback)
	return function()
		if ls.expand_or_jumpable() then
			vim.schedule(function()
				ls.expand_or_jump()
			end)
			return true
		end

		return fallback
	end
end

function M.refresh_snips()
	vim.notify('Refreshing lua snips')

	local module_utils = require('utils.module')

	module_utils.unload_package('ts-utils')
	module_utils.unload_package('snips')
	module_utils.unload_package('nvim.plugins.luasnip')

	ls.cleanup()

	M.register_snippets()

	-- just of testing snips
	module_utils.unload_package('plugins.luasnip.demo')
	require('plugins.luasnip.demo')
end

return M
