-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local autocmd = vim.api.nvim_create_autocmd

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "javascript" },
  callback = function()
    vim.b.autoformat = false
  end,
})

autocmd({ "BufWritePost" }, {
  pattern = { "*.js" },
  callback = function(ev)
    os.execute("clang-format -i " .. vim.fn.expand("%"))
    vim.cmd("e!")
    vim.cmd("redraw!")
  end,
})
