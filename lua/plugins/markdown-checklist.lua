-- Toggle markdown checklist items with <leader>t (markdown only)
local function toggle_checklist_line(line)
  if line:match("^(%s*)- %[x%] ") then
    return (line:gsub("%- %[x%] ", "- [ ] ", 1))
  elseif line:match("^(%s*)- %[ %] ") then
    return (line:gsub("%- %[ %] ", "- [x] ", 1))
  else
    local indent = line:match("^(%s*)") or ""
    local content = line:sub(#indent + 1)
    if content:match("^%- ") then
      content = content:sub(3)
    elseif content:match("^%* ") then
      content = content:sub(3)
    end
    return indent .. "- [ ] " .. content
  end
end

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("markdown_checklist", { clear = true }),
  pattern = { "markdown", "mdx" },
  callback = function()
    vim.keymap.set("n", "<leader>t", function()
      vim.api.nvim_set_current_line(toggle_checklist_line(vim.api.nvim_get_current_line()))
    end, { buffer = true, desc = "Toggle markdown checklist" })

    vim.keymap.set("v", "<leader>t", function()
      local start_line = vim.fn.line("v")
      local end_line = vim.fn.line(".")
      if start_line > end_line then
        start_line, end_line = end_line, start_line
      end
      local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
      for i, line in ipairs(lines) do
        lines[i] = toggle_checklist_line(line)
      end
      vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, lines)
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
    end, { buffer = true, desc = "Toggle markdown checklist (visual)" })
  end,
})

return {}
