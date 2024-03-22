local rg_glob_list = {
	'!.git/',
	'!node_modules/',
	'!target/',
	'!sass_cache/',
	'!dist',
	'!.next'
	'!.pnpm-store'
}

local rg_cmd = {
	'rg',
	'--no-ignore',
	'--hidden',
	'--files',
}

if #rg_cmd ~= 0 then
	for _, ignore_item in ipairs(rg_glob_list) do
		table.insert(rg_cmd, '--glob=' .. ignore_item)
	end
end

return {
	'nvim-telescope/telescope.nvim',
	keys = function()
		return {
			{
				',,',
				function()
					require('telescope.builtin').find_files({
						find_command = rg_cmd,
					})
				end,
				desc = 'Find Files',
			},
			{
				'<leader>/',
				function()
					require('telescope.builtin').live_grep({
						glob_pattern = rg_glob_list,
						additional_args = {
							'--no-ignore',
							'--hidden',
						},
					})
				end,
				desc = 'Find Word',
			},
		}
	end,
	opts = function()
		return {
			defaults = {
				-- Default configuration for telescope goes here:
				-- config_key = value,
				mappings = {
					i = {
						['<C-n>'] = 'move_selection_next',
						['<C-e>'] = 'move_selection_previous',
					},
				},
			},
		}
	end,
}
