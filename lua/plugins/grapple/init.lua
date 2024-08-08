return {
	'cbochs/grapple.nvim',
	opts = {
		scope = 'git_branch',
		tag_hook = function() end,
	},
	event = 'LazyFile',
	cmd = 'Grapple',
	keys = function()
		local keys = {}

		table.insert(keys, {
			',L',
			function()
				require('grapple').open_tags()
			end,
			desc = 'Grapple toggle UI',
		})

		table.insert(keys, {
			',l',
			function()
				require('grapple').tag()
			end,
			desc = 'Grapple add a file',
		})

		for i = 1, 5, 1 do
			table.insert(keys, {
				('<c-%i>'):format(i),
				function()
					require('grapple').select({
						index = i,
					})
				end,
			})
		end

		return keys
	end,
}
