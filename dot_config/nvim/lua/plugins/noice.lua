local function noiceWrapper(pattern, kind)
  kind = kind or ""
  return {
    kind = kind,
    find = pattern,
  }
end

-- add here to suppress messages
local suppressMessages = {
  noiceWrapper("Pattern not found", "emsg"),
  noiceWrapper("%d+L, %d+B"),
  noiceWrapper("%d+ more lines"), -- 5 more lines
  noiceWrapper("%d+ fewer lines"), -- 5 fewer lines
  noiceWrapper("%d+ lines yanked"), -- 5 lines yanked
}
return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.routes = {
        {
          filter = {
            any = suppressMessages,
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "; after #%d+" },
              { find = "; before #%d+" },
              { find = "clipboard: No provider." },
            },
          },
          opts = { skip = true },
        },
      }
    end,
  },
}
