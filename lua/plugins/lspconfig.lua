return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      tailwindcss = {
        filetypes_include = { "html.mako", "markdown" },
      },
      emmet_ls = {
        filetypes = { "mako" },
      },
    },
  },
}
