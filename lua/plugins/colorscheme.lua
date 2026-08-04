return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm",
      on_highlights = function(highlights, colors)
        highlights["@markup.strong"] = { fg = colors.orange, bold = true }
      end,
    },
  },
  { "rose-pine/neovim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
