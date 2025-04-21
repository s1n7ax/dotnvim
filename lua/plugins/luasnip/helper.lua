local config = require('plugins.luasnip.config')
local ls = require('luasnip')

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

function M.expand_or_jump()
	return function()
		if ls.expand_or_locally_jumpable() then
			vim.schedule(function()
				ls.expand_or_jump(1)
			end)
			return true
		else
			vim.api.nvim_feedkeys(
				vim.api.nvim_replace_termcodes('<c-i>', true, false, true),
				'n',
				false
			)
		end
	end
end

function M.jump_prev()
	return function()
		if ls.jumpable(-1) then
			vim.schedule(function()
				ls.jump(-1)
			end)
			return true
		end
	end
end

function M.change_choice()
	return function()
		if ls.choice_active() then
			vim.schedule(function()
				ls.change_choice(1)
			end)
			return true
		end
	end
end

function M.refresh_snips()
	return function()
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
