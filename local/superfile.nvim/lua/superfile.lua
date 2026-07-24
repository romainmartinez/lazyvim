local M = {}

function M.open(dir)
  local chooser = vim.fn.tempname()

  local win = Snacks.terminal.open({ "spf", "--chooser-file", chooser, dir }, {
    cwd = dir,
    auto_close = true,
  })

  vim.api.nvim_create_autocmd("TermClose", {
    buffer = win.buf,
    once = true,
    callback = function()
      if not vim.uv.fs_stat(chooser) then
        return
      end
      for _, path in ipairs(vim.fn.readfile(chooser)) do
        if path ~= "" then
          vim.cmd.edit({ args = { path } })
        end
      end
      vim.fn.delete(chooser)
    end,
  })
end

return M
