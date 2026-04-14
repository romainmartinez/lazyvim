return {
  "MagicDuck/grug-far.nvim",
  keys = {
    {
      "<leader>sr",
      function()
        local grug = require("grug-far")
        local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
        grug.open({
          prefills = {
            flags = (ext and ext ~= "" and ("--glob=*." .. ext .. " ") or "") .. "--multiline",
            paths = vim.fn.expand("%"),
          },
        })
      end,
      mode = { "n", "v" },
      desc = "Search and Replace (Current File)",
    },
  },
}
