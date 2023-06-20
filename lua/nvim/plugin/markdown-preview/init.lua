return {
	'iamcco/markdown-preview.nvim',
	ft = 'markdown',
	build = 'cd app && npm install',
	config = function()
		local Variable = require('nvim.utils.nvim.variable')

		Variable.g({
			mkdp_auto_start = false,
			mkdp_auto_close = false,
			mkdp_refresh_slow = false,
			mkdp_command_for_global = false,
			mkdp_open_to_the_world = false,
			mkdp_echo_preview_url = false,
			mkdp_preview_options = { sync_scroll_type = 'middle' },
			mkdp_filetypes = { 'markdown' },
			mkdp_port = '8197',
		})
	end,
}
