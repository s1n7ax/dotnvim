-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local del_norm = {
	{
		mode = { 'n', 't' },
		keymaps = {
			'<c-h>',
			'<c-j>',
			'<c-k>',
			'<c-l>',
		},
	},
}

for _, rule in ipairs(del_norm) do
	for _, keymap in ipairs(rule.keymaps) do
		vim.keymap.del(rule.mode, keymap)
	end
end

require('config.keymaps.colemak-remaps')
require('config.keymaps.command')
require('config.keymaps.insert')
require('config.keymaps.normal')
require('config.keymaps.terminal')
require('config.keymaps.visual')
