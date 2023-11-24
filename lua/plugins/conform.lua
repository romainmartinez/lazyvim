return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        -- to be able to select all the rules (which include sort imports)
        ruff_fix = {
          prepend_args = {
            "--select",
            "ALL",
          },
        },
        -- to be able to format long string
        -- once this is integrated into ruff, we can remove this
        black = {
          prepend_args = { "--preview", "-" },
        },
      },
      formatters_by_ft = {
        python = { "ruff_format", "ruff_fix", "black" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        vue = { "prettierd" },
        css = { "prettierd" },
        scss = { "prettierd" },
        less = { "prettierd" },
        html = { "prettierd" },
        mako = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
      },
    },
  },
}
