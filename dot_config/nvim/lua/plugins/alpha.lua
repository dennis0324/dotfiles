local logo = [[
        ⟋|､
          (°､ ｡ 7
          |､  ~ヽ
            じしf_,)〳
]]
logo = string.rep("\n", 8) .. logo .. "\n\n"
return {
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      opts.config.header = vim.split(logo, "\n")
      opts.config.center = {
        {
          action = "Telescope find_files",
          desc = " Find file",
          icon = " ",
          key = "f",
        },
        {
          action = "ene | startinsert",
          desc = " New file",
          icon = " ",
          key = "n",
        },
        {
          action = "Telescope oldfiles",
          desc = " Recent files",
          icon = " ",
          key = "r",
        },
        {
          action = [[lua require("lazyvim.util").telescope.config_files()()]],
          desc = " Config",
          icon = " ",
          key = "c",
        },
        {
          action = "LazyExtras",
          desc = " Lazy Extras",
          icon = " ",
          key = "x",
        },
      }
    end,
  },
}
