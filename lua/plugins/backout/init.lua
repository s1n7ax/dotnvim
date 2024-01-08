return {
	'AgusDOLARD/backout.nvim',
	opts = {},
	keys = {
		{ '<M-m>', "<cmd>lua require('backout').back()<cr>", mode = { 'i' } },
		{ '<M-i>', "<cmd>lua require('backout').out()<cr>", mode = { 'i' } },
	},
}
