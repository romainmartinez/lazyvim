-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- save file
vim.keymap.set("n", "<leader>fs", "<cmd>w<cr><esc>", { desc = "Save File" })

-- center cursor when moving half-page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center cursor after moving down half-page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center cursor after moving up half-page" })

-- toggle markdown checklist
vim.keymap.set("n", "<leader>t", function()
  local line = vim.api.nvim_get_current_line()
  local new_line

  if line:match("^(%s*)- %[x%] ") then
    -- checked -> unchecked
    new_line = line:gsub("%- %[x%] ", "- [ ] ", 1)
  elseif line:match("^(%s*)- %[ %] ") then
    -- unchecked -> checked
    new_line = line:gsub("%- %[ %] ", "- [x] ", 1)
  else
    -- no checklist -> add unchecked, respecting indentation
    local indent = line:match("^(%s*)") or ""
    local content = line:sub(#indent + 1)
    -- strip existing "- " or "* " prefix if present
    if content:match("^%- ") then
      content = content:sub(3)
    elseif content:match("^%* ") then
      content = content:sub(3)
    end
    new_line = indent .. "- [ ] " .. content
  end

  vim.api.nvim_set_current_line(new_line)
end, { desc = "Toggle markdown checklist" })

-- copy file path with line number/range
vim.keymap.set({ "n", "v" }, "<leader>ay", function()
  local filepath = vim.fn.expand("%")
  local mode = vim.fn.mode()
  if mode:match("^[vV\22]") then
    local start_line = math.min(vim.fn.line("v"), vim.fn.line("."))
    local end_line = math.max(vim.fn.line("v"), vim.fn.line("."))
    local text = string.format("@%s:%d-%d", filepath, start_line, end_line)
    vim.fn.setreg("+", text)
    vim.notify("Copied: " .. text, vim.log.levels.INFO)
  else
    local text = string.format("@%s:%d", filepath, vim.fn.line("."))
    vim.fn.setreg("+", text)
    vim.notify("Copied: " .. text, vim.log.levels.INFO)
  end
end, { desc = "Send path with line number" })
