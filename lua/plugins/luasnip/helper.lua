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

function M.expand_or_jump(--[[_fallback_key]])
	return function()
		local ls = require('luasnip')
		if ls.expand_or_jumpable() then
			ls.expand_or_jump()
		end
	end
end

function M.jump_prev(fallback_key)
	return function()
		local ls = require('luasnip')
		if ls.jumpable(-1) then
			ls.jump(-1)
		else
			vim.api.nvim_input(fallback_key)
		end
	end
end

function M.change_choice(fallback_key)
	return function()
		local ls = require('luasnip')
		if ls.choice_active() then
			ls.change_choice(1)
		else
			vim.api.nvim_input(fallback_key)
		end
	end
end

function M.refresh_snips()
	return function()
		local ls = require('luasnip')
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
end

return M
