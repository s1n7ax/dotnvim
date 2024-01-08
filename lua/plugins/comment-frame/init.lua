return {
  's1n7ax/nvim-comment-frame',
  dependencies = {
    { 'nvim-treesitter' }
  },
  keys = { '<leader><leader>cc', '<leader><leader>CC' },
  opts = function()
    local wk = require('which-key')

    wk.register({
      cc = { require('nvim-comment-frame').add_comment, 'Add comment frame' },
      CC = { require('nvim-comment-frame').add_multiline_comment, 'Add multiline comment frame' }
    }, {
      prefix = '<leader><leader>'
    })
  end,
  config = true
}
