return {
  dir = vim.fn.stdpath("config") .. "/local/superfile.nvim",
  name = "superfile.nvim",
  dependencies = { "folke/snacks.nvim" },
  keys = {
    {
      "<leader>e",
      function()
        require("superfile").open(vim.fn.expand("%:p:h"))
      end,
      desc = "Explorer superfile (file dir)",
    },
    {
      "<leader>E",
      function()
        require("superfile").open(vim.fn.getcwd())
      end,
      desc = "Explorer superfile (cwd)",
    },
  },
  init = function()
    -- superfile is the file explorer, so netrw is not loaded at all
    vim.g.loaded_netrwPlugin = 1
  end,
}
