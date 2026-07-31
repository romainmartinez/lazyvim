-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Disable auto-inserting comment leader on new lines
vim.opt.formatoptions:remove({ "c", "r", "o" })

-- Load project-local config (.nvim.lua / .nvimrc / .exrc) from cwd, with a trust prompt
vim.o.exrc = true

-- Socket per herdr pane, so popups can hand files here (cookbook/herdr/config.toml).
-- Colons would parse as host:port; a nested nvim in the same pane can't bind.
if vim.env.HERDR_PANE_ID then
  local sock = vim.fs.normalize("~/.cache/herdr-nvim/" .. vim.env.HERDR_PANE_ID:gsub(":", "-") .. ".sock")
  vim.fn.mkdir(vim.fs.dirname(sock), "p")
  pcall(vim.fn.serverstart, sock)
end
