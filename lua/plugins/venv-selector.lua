-- return {
--   {
--     "linux-cultist/venv-selector.nvim",
--     cmd = "VenvSelect",
--     opts = {
--       search_workspace = false,
--       path = "",
--       parents = 0,
--       anaconda_base_path = "/opt/homebrew/Caskroom/miniconda",
--       anaconda_envs_path = "/opt/homebrew/Caskroom/miniconda/base/envs/",
--     },
--     keys = { { "<leader>cc", "<cmd>:VenvSelectCached<cr>", desc = "Select Cached VirtualEnv" } },
--   },
-- }
return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python",
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "regexp",
    config = function()
      require("venv-selector").setup({
        settings = {
          search = {
            anaconda_base = {
              command = "fd -H '^python[0-9.]*$' --type f --type x /opt/homebrew/Caskroom/miniconda | grep -E '/(base|envs/.+)/bin/python[0-9.]*$'",
              type = "anaconda",
            },
          },
        },
      })
    end,
    keys = {
      { ",v", "<cmd>VenvSelect<cr>" },
    },
  },
}
