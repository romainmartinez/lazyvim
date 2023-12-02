return {
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      {
        "<leader>dd",
        "<cmd>lua require'dap'.clear_breakpoints()<CR>",
        desc = "Clear breakpoints",
      },
    },
    opts = {
      layouts = {
        {
          elements = {
            {
              id = "scopes",
              size = 0.6,
            },
            {
              id = "breakpoints",
              size = 0.2,
            },
            {
              id = "stacks",
              size = 0.2,
            },
            {
              id = "watches",
              size = 0,
            },
          },
          position = "left",
          size = 40,
        },
        {
          elements = {
            {
              id = "repl",
              size = 0.5,
            },
            {
              id = "console",
              size = 0.5,
            },
          },
          position = "bottom",
          size = 10,
        },
      },
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    test_runner = "pytest",
    keys = {
      {
        "<leader>dm",
        function()
          local save_reg = vim.fn.getreg("v") -- Save the current content of the register 'v'
          vim.cmd('silent! normal! "vy"') -- Yank the visual selection into register 'v'
          local selection = vim.fn.getreg("v")
          vim.fn.setreg("v", save_reg) -- Restore the content of the register 'v'
          selection = selection:gsub("\n$", "") -- Remove trailing newlines from the selection
          require("dap").repl.execute(selection)
        end,
        desc = "Evaluate selection",
        mode = { "v" },
      },
      {
        "<leader>dm",
        function()
          local current_line = vim.api.nvim_get_current_line()
          require("dap").repl.execute(current_line)
        end,
        desc = "Evaluate selection",
        mode = { "n" },
      },
    },
  },
}
