return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      tailwindcss = {
        filetypes_include = { "html.mako", "markdown", "py" },
      },
      emmet_ls = {
        filetypes = { "mako" },
      },
    },
  },
}
