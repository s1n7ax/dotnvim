local ls = require('luasnip')
local wk = require('which-key')
local config = require('plugins.luasnip.config')

local M = {}

function M.register_snippets()
	for _, language in ipairs(config.languages) do
		local module_path =
			string.format('plugins.luasnip.snippets.%s', language)

		local ok, snip = pcall(require, module_path)

		if ok then
			snip.setup()
		end
	end
end

function M.register_keymaps()
	wk.register({
		-- when <C-i> is mapped to something, <Tab> default behaviour is shadowed
		-- by the <C-i> mapping. To avoid this, we need to remap the <Tab> to be
		-- itself
		-- https://github.com/neovim/neovim/issues/20719
		['<Tab>'] = { '<Tab>', 'Tab Space' },

		['<C-i>'] = {
			M.expand_or_jump(--[['<C-i>']]),
			'(Snippet) Expand or jump',
		},
		['<C-m>'] = { M.jump_prev('<C-n>'), '(Snippet) Jump prev placeholder' },
		['<C-l>'] = { M.change_choice('<C-l>'), '(Snippet) Change choice' },
	}, { mode = { 'i', 's' } })

	wk.register({
		['<leader><leader>w'] = { M.refresh_snips, '(Snippet) refresh' },
	})
	-- wk.register({
	-- 	['<leader><leader>ww'] = { M.refresh_snippets, '(Snippet) refresh' },
	-- })
end

function M.expand_or_jump(--[[_fallback_key]])
	return function()
		if ls.expand_or_jumpable() then
			ls.expand_or_jump()
		else
			-- vim.api.nvim_input(fallback_key)
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

function M.refresh_snips()
	print('Refreshing lua snips')

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
