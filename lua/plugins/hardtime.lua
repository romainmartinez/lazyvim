return {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  event = "VeryLazy",
  keys = {
    {
      "<leader>uH",
      function()
        require("hardtime").toggle()
        vim.notify("Hardtime toggled")
      end,
      desc = "Toggle Hardtime",
    },
  },
  opts = {},
}
