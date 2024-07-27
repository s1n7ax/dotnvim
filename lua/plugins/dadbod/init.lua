return {
	'kristijanhusak/vim-dadbod-ui',
	optional = true,
	keys = {
		{ '<leader>D', '<cmd>DBUIToggle<CR>', desc = 'Toggle DBUI' },
	},
	init = function()
		local data_path = vim.fn.stdpath('data')

		vim.g.db_ui_auto_execute_table_helpers = 1
		vim.g.db_ui_save_location = data_path .. '/dadbod_ui'
		vim.g.db_ui_show_database_icon = true
		vim.g.db_ui_tmp_query_location = data_path .. '/dadbod_ui/tmp'
		vim.g.db_ui_use_nerd_fonts = true
		vim.g.db_ui_use_nvim_notify = false
		vim.g.db_ui_execute_on_save = false
		vim.g.db_ui_disable_progress_bar = false
	end,
}
