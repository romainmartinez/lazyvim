return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        -- to be able to select all the rules (which include sort imports)
        ruff_fix_all = {
          command = "ruff",
          args = {
            "--fix",
            "--select",
            "ALL",
            "-e",
            "-n",
            "--stdin-filename",
            "$FILENAME",
            "-",
          },
          stdin = true,
        },
        -- to be able to format long string
        -- once this is integrated into ruff, we can remove this
        black_preview = {
          command = "black",
          args = { "--preview", "-" },
          stdin = true,
        },
      },
      formatters_by_ft = {
        python = { "ruff_format", "ruff_fix_all", "black_preview" },
      },
    },
  },
}
