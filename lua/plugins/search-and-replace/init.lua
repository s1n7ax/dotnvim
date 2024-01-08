return {
	's1n7ax/nvim-search-and-replace',
	cmd = {
		'SReplace',
		'SReplaceAll',
		'SReplaceAndSave',
		'SReplaceAllAndSave',
	},
	config = function()
		require('nvim-search-and-replace').setup()
	end,
}
