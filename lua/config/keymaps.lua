-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>fs", "<cmd>w<cr><esc>", { desc = "Save File" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center cursor after moving down half-page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center cursor after moving up half-page" })

vim.keymap.set("n", "<leader>dD", ":w<CR>:split term://python %<CR>i", { desc = "Run file without debugging" })

-- Function to copy all buffers' content with filenames to clipboard
local function copy_all_buffers_to_clipboard()
  local buffers = vim.api.nvim_list_bufs()
  local result = ""
  for _, bufnr in ipairs(buffers) do
    if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_is_valid(bufnr) then
      local filename = vim.api.nvim_buf_get_name(bufnr)
      local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
      local content = table.concat(lines, "\n")
      if result ~= "" then
        result = result .. "\n\n"
      end
      result = result .. "File: " .. filename .. "\n\n" .. content
    end
  end
  vim.fn.setreg("+", result)
  print("All buffer contents copied to clipboard")
end
vim.keymap.set("n", "<leader>bC", copy_all_buffers_to_clipboard, { desc = "Copy all buffers to clipboard" })

-- Function to copy the current buffer to clipboard
local function copy_current_buffer_to_clipboard()
  local current_bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(current_bufnr, 0, -1, false)
  local content = table.concat(lines, "\n")
  vim.fn.setreg("+", content)
  print("Current buffer content copied to clipboard")
end
vim.keymap.set("n", "<leader>bc", copy_current_buffer_to_clipboard, { desc = "Copy current buffer to clipboard" })
