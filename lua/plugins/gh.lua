local gh_user = nil

local function parse_user(text, active)
  local pattern = 'Active account: ' .. tostring(active)
  local lines = vim.split(text, "\n")
  for i, line in ipairs(lines) do
    if line:match(pattern) then
      local prev = lines[i - 1] or ''
      return prev:match("account ([%w%-_]+)")
    end
  end
end

local function gh_auth_status(callback)
  vim.system({ 'gh', 'auth', 'status' }, { text = true, stderr = true }, function(result)
    local output = (result.stdout or '') .. (result.stderr or '')
    callback(output)
  end)
end

local function refresh()
  gh_auth_status(function(output)
    gh_user = parse_user(output, true)
  end)
end

local function toggle()
  gh_auth_status(function(output)
    local target = parse_user(output, false)
    if not target then
      vim.schedule(function() vim.notify('No other gh account found', vim.log.levels.WARN) end)
      return
    end
    vim.system({ 'gh', 'auth', 'switch', '--user', target }, { text = true }, function(res)
      vim.schedule(function()
        if res.code == 0 then
          gh_user = target
          vim.notify('Switched to ' .. target, vim.log.levels.INFO)
        else
          vim.notify('Failed to switch account', vim.log.levels.ERROR)
        end
      end)
    end)
  end)
end

refresh()

return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      sections = {
        lualine_z = {
          {
            function() return " " .. gh_user end,
            cond = function() return gh_user ~= nil end,
          },
        },
      },
    },
  },
  {
    'folke/which-key.nvim',
    opts = {
      spec = {
        { '<leader>gS', toggle, desc = 'Toggle GitHub Account' },
      },
    },
  },
}
