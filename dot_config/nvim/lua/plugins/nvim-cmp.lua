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
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "copilot" },
      }, {
        { name = "buffer" },
      })
    end,
  },
}
