return {
  {

    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shfmt",
        "shellcheck",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        "clang-format",
        "clangd",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.clangd = {
        cmd = { "clangd", "--offset-encoding=utf-16" },
      }
    end,
  },
}
