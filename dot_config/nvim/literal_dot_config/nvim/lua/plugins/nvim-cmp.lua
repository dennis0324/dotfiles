return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = cmp.mapping.preset.insert({
        -- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        -- ["<C-e>"] = cmp.mapping.close(),
        -- ["<Tab>"] = cmp.mapping.confirm({
        --   behavior = cmp.ConfirmBehavior.Replace,
        --   select = true,
        -- }),
      })

      -- opts.sources = cmp.config.sources({
      --   { name = "nvim_lsp" },
      --   { name = "buffer", max_item_count = 5 },
      --   { name = "copilot" },
      --   { name = "path", max_item_count = 5 },
      -- })
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 9999, max_item_count = 5, group_index = 1 },
        { name = "treesitter", priority = 5, max_item_count = 3, group_index = 1 },
        { name = "path", priority = 3, max_item_count = 2, group_index = 1 },
        { name = "copilot", priority = 1, max_item_count = 3, group_index = 1 },
      })
    end,
  },
}
