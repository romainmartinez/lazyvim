-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Auto-save when leaving a buffer or exiting Neovim
vim.api.nvim_create_autocmd({ "BufLeave", "VimLeave", "FocusLost" }, {
  group = augroup("autosave"),
  callback = function()
    if not vim.bo.buftype:match("nofile") then
      vim.cmd("silent! update")
    end
  end,
})
