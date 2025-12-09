return {
  {
    "nvim-mini/mini.ai",
    opts = function(_, opts)
      local ai = require("mini.ai")
      opts.custom_textobjects = opts.custom_textobjects or {}

      -- Create the base treesitter spec
      local ts_spec = ai.gen_spec.treesitter({
        a = "@tag.outer",
        i = "@tag.inner",
      })

      -- Helper to check if cursor is inside a start_tag or end_tag
      local function get_cursor_tag_context()
        local cursor = vim.api.nvim_win_get_cursor(0)
        local cursor_line, cursor_col = cursor[1], cursor[2]

        local ok, parser = pcall(vim.treesitter.get_parser, 0)
        if not ok or not parser then
          return nil
        end

        local tree = parser:parse()[1]
        if not tree then
          return nil
        end

        local node = tree:root():named_descendant_for_range(
          cursor_line - 1, cursor_col,
          cursor_line - 1, cursor_col
        )

        -- Walk up to find if we're inside start_tag or end_tag
        local current = node
        while current do
          local node_type = current:type()
          if node_type == "start_tag" then
            return { tag_type = "start", tag_node = current, element_node = current:parent() }
          elseif node_type == "end_tag" then
            return { tag_type = "end", tag_node = current, element_node = current:parent() }
          elseif node_type == "element" or node_type == "template_element"
              or node_type == "script_element" or node_type == "style_element" then
            return nil
          end
          current = current:parent()
        end
        return nil
      end

      -- Helper to get element's inner content region
      local function get_element_content_region(element_node)
        local start_tag_node = nil
        local end_tag_node = nil
        local content_nodes = {}

        for child in element_node:iter_children() do
          local child_type = child:type()
          if child_type == "start_tag" then
            start_tag_node = child
          elseif child_type == "end_tag" then
            end_tag_node = child
          elseif start_tag_node and not end_tag_node then
            table.insert(content_nodes, child)
          end
        end

        if #content_nodes > 0 and end_tag_node then
          local first = content_nodes[1]
          local last = content_nodes[#content_nodes]
          local sr1, sc1 = first:range()
          local _, _, er2, ec2 = last:range()

          return {
            from = { line = sr1 + 1, col = sc1 + 1 },
            to = { line = er2 + 1, col = ec2 },
          }
        end
        return nil
      end

      -- Custom tag textobject that handles cursor inside start_tag/end_tag
      opts.custom_textobjects.t = function(ai_type)
        -- For 'a' (around), just use treesitter spec directly
        if ai_type == "a" then
          return ts_spec(ai_type)
        end

        -- Check if cursor is in a tag
        local ctx = get_cursor_tag_context()
        if ctx and ctx.element_node then
          local content_region = get_element_content_region(ctx.element_node)
          if content_region then
            -- Return the region directly (not in array) to bypass covering check
            return content_region
          end
        end

        -- Default: use treesitter spec
        return ts_spec(ai_type)
      end
    end,
  },
}
