return {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  keys = {
    {
      "<leader>uH",
      function()
        require("hardtime").toggle()
      end,
      desc = "Toggle Hardtime",
    },
  },
  opts = {
    enabled = false, -- Start disabled, toggle with <leader>uH
  },
}
