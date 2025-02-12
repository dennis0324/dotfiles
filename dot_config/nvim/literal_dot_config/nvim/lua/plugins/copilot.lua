return {
  {
    "zbirenbaum/copilot.lua",
    event = { "BufEnter" },
    opts = function(_, opts)
      opts.suggestion.enabled = false
    end,
  },
}

-- ttesting for
--
