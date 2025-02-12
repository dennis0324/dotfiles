--   default color scheme

--   bg = "#222436",
--   black = "#1b1d2b",
--   blue = "#82aaff",
--   blue0 = "#3e68d7",
--   blue1 = "#65bcff",
--   blue2 = "#0db9d7",
--   blue5 = "#89ddff",
--   blue6 = "#b4f9f8",
--   blue7 = "#394b70",
--   border = "#1b1d2b",
--   border_highlight = "#589ed7",
--   comment = "#636da6",
--   cyan = "#86e1fc",
--   dark3 = "#545c7e",
--   dark5 = "#737aa2",
--hint = "#4fd6be",

local colorsdefined = require("config.utils.color")

return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = function(_, opts)
      opts.on_colors = function(colors)
        colors.bg = "#101010"
        colors.fg = "#c2c2c2"
        colors.bg_dark = "#000000"
        colors.border_highlight = colorsdefined.theme.color15
        -- this is for selection visual background
        colors.bg_visual = "#404040"
        colors.comment = "#707070"

        colors.bg_popup = "#101010"
        colors.bg_highlight = "#202020"
        colors.bg_float = "#101010"
        colors.bg_search = "#101010"
        colors.bg_sidebar = "#101010"
        colors.fg_gutter = "#333333"
        -- colors.fg_dark = "#b2b2b2"
        -- colors.fg_float = "#c8d3f5"
      end
      opts.on_highlights = function(hl, _)
        local palette = require("config.utils.color")
        hl.NeoTreeDirSlash = {
          fg = palette.theme.highlight,
        }
        hl.NeoTreeNormal = {
          fg = palette.theme.highlight,
          bg = palette.theme.primary,
        }
        hl.NeoTreeNormalNC = {
          fg = palette.theme.highlight,
          bg = palette.theme.primary,
        }
        hl.TelescopeBorder = {
          bg = palette.theme.primary,
          fg = palette.theme.highlight,
        }
        hl.TelescopeNormal = {
          bg = palette.theme.primary,
          fg = palette.theme.highlight,
        }
        hl.Substitute = {
          bg = palette.theme.primary,
        }
        hl.NoiceCmdlinePopupBorder = {
          fg = palette.theme.highlight,
        }
        hl.NoiceCmdlineIconCmdline = {
          fg = palette.theme.highlight,
        }
        hl.NoiceCmdlinePopupTitle = {
          fg = palette.theme.highlight,
        }
        hl.GitSignsAdd = {
          fg = "#d2ebbe",
        }
        hl.GitSignsChange = {
          fg = "#ffcc99",
        }
        hl.GitSignsDelete = {
          fg = palette.theme.color1,
        }
        hl.MiniIndentscopeSymbol = {
          fg = "#c2c2c2",
        }
        hl.CursorLineNr = {
          fg = "#c2c2c2",
        }
        hl.TreesitterContext = {
          bg = palette.theme.primary,
        }
      end
    end,
  },
}
