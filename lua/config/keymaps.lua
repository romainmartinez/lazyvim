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
  local count = 0
  for _, bufnr in ipairs(buffers) do
    if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_is_valid(bufnr) then
      local filename = vim.api.nvim_buf_get_name(bufnr)
      if filename ~= "" then -- Check if the buffer is linked to a file
        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
        local content = table.concat(lines, "\n")
        if result ~= "" then
          result = result .. "\n\n"
        end
        result = result .. "File: " .. filename .. "\n```\n" .. content .. "\n```"
        count = count + 1
      end
    end
  end
  vim.fn.setreg("+", result)
  vim.notify(count .. " buffer(s) copied to clipboard")
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

-- Function to copy the current buffer to new buffer
local function copy_all_buffers_to_new_buffer()
  local buffers = vim.api.nvim_list_bufs()
  local result = ""
  local count = 0
  for _, bufnr in ipairs(buffers) do
    if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_is_valid(bufnr) then
      local filename = vim.api.nvim_buf_get_name(bufnr)
      if filename ~= "" then -- Check if the buffer is linked to a file
        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
        local content = table.concat(lines, "\n")
        if result ~= "" then
          result = result .. "\n\n"
        end
        result = result .. "File: " .. filename .. "\n```\n" .. content .. "\n```"
        count = count + 1
      end
    end
  end

  local new_buf = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_buf_set_name(new_buf, "All Buffers Content")
  local result_lines = vim.split(result, "\n")
  vim.api.nvim_buf_set_lines(new_buf, 0, -1, false, result_lines)
  vim.api.nvim_command("vsplit")
  vim.api.nvim_win_set_buf(0, new_buf)
  vim.api.nvim_buf_set_option(new_buf, "modifiable", false)
  vim.notify(count .. " buffer(s) content copied to new buffer")
end

vim.keymap.set("n", "<leader>bC", copy_all_buffers_to_new_buffer, { desc = "Copy all buffers to new buffer" })
