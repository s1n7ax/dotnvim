return {
	'cbochs/grapple.nvim',
	event = 'VeryLazy',
	opts = {
		scope = 'git_branch',
	},
	cmd = 'Grapple',
	keys = function()
		local keys = {
			{ ',l', '<cmd>Grapple toggle<cr>', desc = 'Harpoon Add File' },
			{ ',L', '<cmd>Grapple toggle_tags<cr>', desc = 'Harpoon Toggle UI' },
		}

		for i = 1, 5 do
			table.insert(keys, {
				'<c-' .. i .. '>',
				string.format('<cmd>Grapple select index=%d<cr>', i),
				desc = 'Grapple ' .. i,
			})
		end

		return keys
	end,
}
