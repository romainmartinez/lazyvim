return {
  "folke/persistence.nvim",
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      once = true,
      nested = true,
      callback = function()
        if vim.fn.argc(-1) > 0 then
          return
        end
        -- bufferline restores pins on SessionLoadPost, so it must be set up first
        require("lazy").load({ plugins = { "bufferline.nvim" } })
        require("persistence").load()
      end,
    })
  end,
}
