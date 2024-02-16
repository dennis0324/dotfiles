local palette = require("config.utils.color")
local colors = {
  bg = palette.theme.primary,
  fg = "#c2c2c2",
  yellow = palette.theme.color3,
  cyan = "#008080",
  darkblue = palette.theme.color4,
  green = palette.theme.color10,
  orange = "#FF8800",
  violet = palette.theme.color5,
  magenta = palette.theme.color13,
  blue = palette.theme.color12,
  red = palette.theme.color9,
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Inserts a component in lualine_c at left section
local function ins_left(opts, component)
  table.insert(opts.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(opts, component)
  table.insert(opts.sections.lualine_x, component)
end

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.options = {
        -- Disable sections and component separators
        component_separators = "",
        section_separators = "",
        theme = {
          -- We are going to use lualine_c an lualine_x as left and
          -- right section. Both are highlighted by c theme .  So we
          -- are just setting default looks o statusline
          normal = { c = { fg = colors.fg, bg = colors.bg } },
          inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
      }
      opts.sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
      }

      ins_left(opts, {
        -- mode component
        function()
          return "▊"
        end,
        color = function()
          -- auto change color according to neovims mode
          local mode_color = {
            n = colors.red,
            i = colors.green,
            v = colors.blue,
            [""] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [""] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ["r?"] = colors.cyan,
            ["!"] = colors.red,
            t = colors.red,
          }
          return { fg = mode_color[vim.fn.mode()] }
        end,
        padding = { right = 1 },
      })
      -- git brnach
      ins_left(opts, {
        "branch",
        icon = "",
        color = { fg = colors.violet, gui = "bold" },
      })

      ins_left(opts, {
        "diff",
        -- Is it me or the symbol for modified us really weird
        symbols = { added = " ", modified = "󰝤 ", removed = " " },
        diff_color = {
          added = { fg = colors.green },
          modified = { fg = colors.orange },
          removed = { fg = colors.red },
        },
        cond = conditions.hide_in_width,
      })
      -- filesize
      ins_left(opts, {
        -- filesize component
        "filesize",
        cond = conditions.buffer_not_empty,
      })

      -- display file name in left side
      ins_left(opts, {
        "filename",
        cond = conditions.buffer_not_empty,
        color = { gui = "bold" },
      })

      -- file type
      ins_right(opts, {
        "filetype",
      })
      ins_right(opts, {
        -- Lsp server name .
        function()
          local msg = "No Active Lsp"
          local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = " LSP:",
        color = { fg = "#ffffff", gui = "bold" },
      })

      -- diagnostics
      ins_right(opts, {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " " },
        diagnostics_color = {
          color_error = { fg = colors.red },
          color_warn = { fg = colors.yellow },
          color_info = { fg = colors.cyan },
        },
      })

      -- percent of file location
      ins_right(opts, { "progress", color = { fg = colors.fg, gui = "bold" } })
    end,
  },
}
