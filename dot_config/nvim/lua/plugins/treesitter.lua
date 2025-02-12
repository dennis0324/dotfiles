return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enabled = true,
      },
      ensure_installed = {
        "astro",
        "cmake",
        "cpp",
        "css",
        "fish",
        "gitignore",
        "go",
        "graphql",
        "http",
        "php",
        "rust",
        "scss",
        "sql",
        "svelte",
        "javascript",
        "typescript",
        "tsx",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
        vim.treesitter.language.register("markdown", "mdx"),
      })
    end,
  },
}
