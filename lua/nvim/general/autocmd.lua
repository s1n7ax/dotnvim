local list_util = require('nvim.utils.lua.list')
local ThemeManager = require('nvim.utils.nvim.theme.theme-manager')
local HighlightGroups = require('nvim.utils.nvim.highlighting.highlight-groups')
local highlighter = require('nvim.utils.nvim.highlighting.highlighter')

local theme = ThemeManager.get_theme()

local highlight_groups = HighlightGroups({
	TextYank = { guibg = theme.normal.yellow, guifg = theme.normal.black },
})

highlighter:new():add(highlight_groups):register_highlights()

local cmd_group =
	vim.api.nvim_create_augroup('general_autocmd', { clear = true })

-- highlight text on yank
vim.api.nvim_create_autocmd('TextYankPost', {
	pattern = '*',
	callback = function()
		vim.highlight.on_yank({
			higroup = highlight_groups.TextYank.name,
			timeout = 100,
			on_visual = true,
		})
	end,
	group = cmd_group,
})

-- set the winbar
vim.api.nvim_create_autocmd('BufWinEnter', {
	pattern = '*',
	callback = function()
		-- skip if a pop up window
		if vim.fn.win_gettype() == 'popup' then
			return
		end

		-- skip if new buffer
		if vim.bo.filetype == '' then
			return
		end

		vim.wo.winbar = "%{%v:lua.require'nvim.utils.nvim.winbar'.eval()%}"
	end,
	group = cmd_group,
})

-- open terminals in insert mode
vim.api.nvim_create_autocmd({ 'BufWinEnter', 'TermOpen' }, {
	pattern = 'term://*',
	command = 'startinsert',
	group = cmd_group,
})

-- show cursor column and line on window enter
vim.api.nvim_create_autocmd('WinEnter', {
	callback = function()
		vim.wo.cursorcolumn = true
		vim.wo.cursorline = true
	end,
	group = cmd_group,
})

-- remove cursor column and line on window leave
vim.api.nvim_create_autocmd('WinLeave', {
	callback = function()
		vim.wo.cursorcolumn = false
		vim.wo.cursorline = false
	end,
	group = cmd_group,
})

-- save after some time
vim.api.nvim_create_autocmd({ 'CursorHold', 'WinClosed' }, {
	pattern = '*',
	callback = function(ev)
		local buffer = vim.api.nvim_get_current_buf()

		---WinClosed is not from the current window
		if ev.event == 'WinClosed' and ev.buf ~= buffer then
			return
		end

		if
			vim.bo.modifiable
			and list_util.some({
				'lua',
				'java',
				'markdown',
				'rust',
				'javascript',
				'typescript',
				'reactjavascript',
				'reacttypescript',
			}, function(ft)
				return ft == vim.bo.filetype
			end)
		then
			vim.cmd.update({ mods = {
				silent = true,
			} })
		end
	end,
})

-- Save on window close
vim.api.nvim_create_autocmd('WinClosed', {
	pattern = '*',
	callback = function(ev)
		local buffer = vim.api.nvim_get_current_buf()

		---WinClosed is not from the current window
		if ev.event == 'WinClosed' and ev.buf ~= buffer then
			return
		end

		if
			vim.bo.modifiable
			and list_util.some({
				'lua',
				'java',
				'markdown',
				'rust',
				'javascript',
				'typescript',
				'reactjavascript',
				'reacttypescript',
			}, function(ft)
				return ft == vim.bo.filetype
			end)
		then
			vim.cmd.write({ mods = { silent = true } })
		end
	end,
})

-- format on save
vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = '*',
	callback = function()
		local buffer = vim.api.nvim_get_current_buf()

		for _, client in ipairs(vim.lsp.get_active_clients()) do
			if client.attached_buffers[buffer] then
				vim.lsp.buf.format()
			end
		end
	end,
})
