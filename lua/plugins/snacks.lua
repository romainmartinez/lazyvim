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
      picker = {
        actions = {
          toggle_hidden_ignored = function(picker)
            picker.opts.hidden = not picker.opts.hidden
            picker.opts.ignored = picker.opts.hidden
            picker:find({ refresh = true })
          end,
        },
        win = {
          input = {
            keys = {
              ["<a-.>"] = { "toggle_hidden_ignored", mode = { "i", "n" } },
            },
          },
        },
      },
    },
    keys = {
      { "<leader>e", false },
      { "<leader>E", false },
      { "<C-g>", function() Snacks.lazygit() end, desc = "Lazygit" },
    },
  },
}
