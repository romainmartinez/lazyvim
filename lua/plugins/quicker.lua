return {
  {
    "stevearc/quicker.nvim",
    ft = "qf",
    opts = {
      on_qf = function(bufnr)
        vim.api.nvim_buf_set_name(bufnr, "quicker://" .. bufnr)
      end,
      keys = {
        {
          ">",
          function()
            require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
          end,
          desc = "Expand quickfix context",
        },
        {
          "<",
          function()
            require("quicker").collapse()
          end,
          desc = "Collapse quickfix context",
        },
      },
    },
    keys = {
      {
        "<leader>xq",
        function()
          require("quicker").toggle()
        end,
        desc = "Quickfix List (Quicker)",
      },
      {
        "<leader>xl",
        function()
          require("quicker").toggle({ loclist = true })
        end,
        desc = "Location List (Quicker)",
      },
    },
  },
}
