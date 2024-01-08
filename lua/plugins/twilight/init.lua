return {
  "folke/twilight.nvim",
  name = 'twilight',
  enabled = false,
  opts = {
    dimming = {
      alpha = 0.25,
      color = { "Normal", "#ffffff" },
      term_bg = "#000000",
      inactive = false,
    },
    context = 10,
    treesitter = true,
    expand = {
      "function",
      "method",
      "table",
      "if_statement",
    },
    exclude = {},
  }
}
