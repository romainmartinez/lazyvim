return {
  {
    "linux-cultist/venv-selector.nvim",
    cmd = "VenvSelect",
    opts = {
      search_workspace = false,
      path = "",
      parents = 0,
      anaconda_base_path = "/Users/romainm/miniconda",
      anaconda_envs_path = "/Users/romainm/miniconda/envs/",
    },
    keys = { { "<leader>cc", "<cmd>:VenvSelectCached<cr>", desc = "Select Cached VirtualEnv" } },
  },
}
