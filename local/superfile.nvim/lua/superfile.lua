local M = {}

function M.open(dir)
  local chooser = vim.fn.tempname()

  -- auto_close's TermClose handler wipes the buffer, deleting our autocmd before it runs
  local term = Snacks.terminal.open({ "spf", "--chooser-file", chooser, dir }, {
    cwd = dir,
    auto_close = false,
  })

  vim.api.nvim_create_autocmd("TermClose", {
    buffer = term.buf,
    once = true,
    callback = function()
      term:close()
      vim.schedule(function()
        if not vim.uv.fs_stat(chooser) then
          return
        end
        for _, path in ipairs(vim.fn.readfile(chooser)) do
          if path ~= "" then
            vim.cmd.edit({ args = { path } })
          end
        end
        vim.fn.delete(chooser)
      end)
    end,
  })
end

return M
