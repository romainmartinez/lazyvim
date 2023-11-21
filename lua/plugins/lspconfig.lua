return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      tailwindcss = {
        filetypes_include = { "html.mako" },
      },
      emmet_ls = {},
    },
  },
}
