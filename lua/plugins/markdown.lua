return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["markdown"] = { "markdownlint-cli2", "markdown-toc" },
        ["markdown.mdx"] = { "markdownlint-cli2", "markdown-toc" },
      },
    },
    keys = {
      {
        "<leader>ct",
        function()
          -- Exit visual mode to set '< and '> marks
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "x", false)
          local first_line = vim.fn.getline("'<")
          local is_html = first_line:match("^%s*<") ~= nil
          local parser = is_html and "vue" or "markdown"
          vim.notify("prettier --parser " .. parser, vim.log.levels.INFO)
          if is_html then
            vim.cmd("'<,'>!{ echo '<template>'; cat; echo '</template>'; } | prettier --parser vue | sed '1d;$d'")
          else
            vim.cmd("'<,'>!prettier --parser markdown")
          end
        end,
        mode = "v",
        ft = "markdown",
        desc = "Format Markdown Selection",
      },
    },
  },
}
