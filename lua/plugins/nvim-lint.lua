return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        -- disable linting for markdown
        markdown = {},
      },
    },
  },
}
