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
        prettier = {
          prepend_args = {
            "--plugin=prettier-plugin-tailwindcss",
          },
        },
      },
      formatters_by_ft = {
        python = { "ruff_format", "ruff_fix" },
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
