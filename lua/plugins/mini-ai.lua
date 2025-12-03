return {
  {
    "nvim-mini/mini.ai",
    opts = function(_, opts)
      local ai = require("mini.ai")
      opts.custom_textobjects = opts.custom_textobjects or {}
      opts.custom_textobjects.t = ai.gen_spec.treesitter({
        a = "@tag.outer",
        i = "@tag.inner",
      })
    end,
  },
}
