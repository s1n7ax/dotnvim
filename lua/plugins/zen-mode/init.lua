return {
  "folke/zen-mode.nvim",
  dependencies = { 'twilight' },
  keys = { ',a' },
  config = function()
    local wk = require('which-key')

    wk.register({
      name = 'Zen Mode',
      a = { '<cmd>ZenMode<cr>', 'Zen Mode' }
    }, {
      prefix = ','
    })

    require('zen-mode').setup {
      window = {
        backdrop = 0.95,
        width = 90,
        options = {
          signcolumn = "yes",    -- disable signcolumn
          number = true,         -- disable number column
          relativenumber = true, -- disable relative numbers
          -- cursorline = false, -- disable cursorline
          -- cursorcolumn = false, -- disable cursor column
          -- foldcolumn = "0", -- disable fold column
          -- list = false, -- disable whitespace characters
        },
      },
    }
  end
}
