return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["markdown"] = { "markdownlint-cli2", "markdown-toc" },
        ["markdown.mdx"] = { "markdownlint-cli2", "markdown-toc" },
      },
    },
    keys = {
      {
        "<leader>ct",
        ":'<,'>!prettier --parser markdown<cr>",
        mode = "v",
        ft = "markdown",
        desc = "Format Markdown Selection",
      },
    },
  },
}
