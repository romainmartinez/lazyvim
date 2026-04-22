local exclude = { "node_modules", ".git", ".venv", "*.lock", "*lock.yaml", ".output" }

return {
  "snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = {
          hidden = true,
          ignored = true,
          exclude = exclude,
        },
        grep = {
          exclude = exclude,
        },
      },
    },
  },
}
