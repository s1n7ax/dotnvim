-- bootstrap lazy.nvim, LazyVim and your plugins
require('config.lazy')

vim.keymap.set('n', '<leader><leader>s', '<cmd>JavaTestRunCurrentClass<cr>')
vim.keymap.set('n', '<leader><leader>r', '<cmd>JavaTestViewLastReport<cr>')
