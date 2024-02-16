return {
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
    })
  end,
}
