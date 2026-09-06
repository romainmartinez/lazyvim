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
      "<cmd>Yazi<cr>",
      desc = "Explorer Yazi (current file)",
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
      copy_relative_path_to_selected_files = false,
    },
  },
}
