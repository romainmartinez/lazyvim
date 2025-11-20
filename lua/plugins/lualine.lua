return {
  "nvim-lualine/lualine.nvim",
  opts = {
    sections = {
      -- remove the clock from the bottom
      lualine_z = {},
      lualine_y = {
        { "location", padding = { left = 0, right = 1 } },
      },
    },
  },
}
