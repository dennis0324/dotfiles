return {
  {
    "RRethy/vim-illuminate",
    lazy = true,
    config = function()
      require("illuminate").configure({
        under_cursor = false,
        filetypes_denylist = {},
      })
    end,
  },
}
