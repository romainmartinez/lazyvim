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
        prettier = {
          prepend_args = {
            "--plugin=prettier-plugin-tailwindcss",
          },
        },
      },
      formatters_by_ft = {
        python = { "ruff_format", "ruff_fix", "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        vue = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        less = { "prettier" },
        html = { "prettier" },
        mako = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
      },
    },
  },
}
