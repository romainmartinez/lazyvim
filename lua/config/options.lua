-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Disable auto-inserting comment leader on new lines
vim.opt.formatoptions:remove({ "c", "r", "o" })

-- Load project-local config (.nvim.lua / .nvimrc / .exrc) from cwd, with a trust prompt
vim.o.exrc = true

-- Socket per Rex block, so the lazygit and yazi floats can hand files here (cookbook/rex/floats.lua).
-- Colons would parse as host:port; a nested nvim in the same block leaves the live socket alone.
if vim.env.REX_BLOCK then
  local sock = vim.fs.normalize("~/.cache/rex-nvim/" .. vim.env.REX_BLOCK:gsub("^block:", "") .. ".sock")
  local live, chan = pcall(vim.fn.sockconnect, "pipe", sock)
  if live then
    vim.fn.chanclose(chan)
  else
    vim.fn.mkdir(vim.fs.dirname(sock), "p")
    os.remove(sock)
    pcall(vim.fn.serverstart, sock)
  end
end
