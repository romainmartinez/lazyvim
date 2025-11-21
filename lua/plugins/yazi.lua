return {
  "mikavilpas/yazi.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  keys = {
    {
      "<leader>e",
      function()
        require("yazi").yazi(nil, LazyVim.root())
      end,
      desc = "Explorer Yazi (root dir)",
    },
    {
      "<leader>E",
      "<cmd>Yazi cwd<cr>",
      desc = "Explorer Yazi (cwd)",
    },
  },
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
  init = function()
    -- mark netrw as loaded so it's not loaded at all.
    -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
    vim.g.loaded_netrwPlugin = 1
  end,
}
