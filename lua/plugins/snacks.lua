return {
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = {
        win = {
          width = 0,
          height = 0,
        },
      },
    },
    keys = {
      { "<C-g>", function() Snacks.lazygit() end, desc = "Lazygit" },
    },
  },
}
