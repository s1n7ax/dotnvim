return {
	'nvim-neo-tree/neo-tree.nvim',
	optional = true,
	keys = {
		{
			'<leader>e',
			function()
				require('neo-tree.command')._command('reveal', 'toggle')
			end,
			desc = 'Reveal NeoTree (curren buffer)',
		},
	},
	opts = {
		popup_border_style = 'solid',
		window = {
			mappings = { e = 'none' },
			position = 'float',
		},
		filesystem = {
			group_empty_dirs = true,
			window = {
				mappings = {
					['/'] = 'noop',
					['z'] = 'noop',
					['?'] = 'noop',
					['<c-x>'] = 'open_split',
					['<c-v>'] = 'open_vsplit',
					Y = 'copy_selector',
				},
			},
		},

		-- copy the path of the file to the clipboard
		commands = {
			copy_selector = function(state)
				local node = state.tree:get_node()
				local filepath = node:get_id()
				local filename = node.name
				local modify = vim.fn.fnamemodify

				local vals = {
					['BASENAME'] = modify(filename, ':r'),
					['EXTENSION'] = modify(filename, ':e'),
					['FILENAME'] = filename,
					['PATH (CWD)'] = modify(filepath, ':.'),
					['PATH (HOME)'] = modify(filepath, ':~'),
					['PATH'] = filepath,
					['URI'] = vim.uri_from_fname(filepath),
				}

				local options = vim.tbl_filter(function(val)
					return vals[val] ~= ''
				end, vim.tbl_keys(vals))
				if vim.tbl_isempty(options) then
					vim.notify('No values to copy', vim.log.levels.WARN)
					return
				end
				table.sort(options)
				vim.ui.select(options, {
					prompt = 'Choose to copy to clipboard:',
					format_item = function(item)
						return ('%s: %s'):format(item, vals[item])
					end,
				}, function(choice)
					local result = vals[choice]
					if result then
						vim.notify(('Copied: `%s`'):format(result))
						vim.fn.setreg('+', result)
					end
				end)
			end,
		},
	},
}
