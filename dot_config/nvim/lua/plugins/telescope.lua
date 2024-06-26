return {

  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>,",
        "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
        desc = "Switch Buffer",
      },
      { "<leader>/", false },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader><space>", false },
      -- find
      { "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
      { "<leader>fc", LazyVim.pick.config_files(), desc = "Find Config File" },
      { "<leader>ff", LazyVim.pick("auto"), desc = "Find Files (root dir)" },
      { "<leader>fF", LazyVim.pick("auto", { cwd = false }), desc = "Find Files (cwd)" },
      { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find Files (git-files)" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>fR", LazyVim.pick("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
      -- git
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
      -- search
      { "<leader>s", false }, --"<cmd>Telescope registers<cr>", desc = "Registers"
      { "<leader>sa", false }, --"<cmd>Telescope autocommands<cr>", desc = "Auto Commands"
      { "<leader>sb", false }, --"<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer"
      { "<leader>sc", false }, --"<cmd>Telescope command_history<cr>", desc = "Command History"
      { "<leader>sC", false }, --"<cmd>Telescope commands<cr>", desc = "Commands"
      { "<leader>sd", false }, --"<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics"
      { "<ledaer>sD", false }, --"<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics"
      { "<leader>sg", LazyVim.pick("live_grep", { cwd = false }), desc = "Grep (cwd)" }, -- Util.telescope("live_grep"), desc = "Grep (root dir)"
      { "<leader>sG", false }, -- Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)"
      { "<leader>sh", false }, -- "<cmd>Telescope help_tags<cr>", desc = "Help Pages"
      { "<leader>sH", false }, -- "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups"
      { "<leader>sk", false }, -- "<cmd>Telescope keymaps<cr>", desc = "Key Maps"
      { "<leader>sM", false }, -- "<cmd>Telescope help_tags<cr>", desc = "Man pages"
      { "<leader>sm", false }, -- "<cmd>Telescope marks<cr>", desc = "Jump to Mark"
      { "<leader>so", false }, -- "<cmd>Telescope vim_options<cr>", desc = "Options"
      { "<leader>sR", false }, -- "<cmd>Telescope resume<cr>", desc = "Resume"
      { "<leader>sw", false }, --Util.telescope("grep_string", { word_match = "-w" }), desc = "Word (root dir)"
      { "<leader>sW", false }, --Util.telescope("grep_string", { cwd = false, word_match = "-w" }), desc = "Word (cwd)"
      { "<leader>sw", LazyVim.pick("grep_string", { cwd = false }), mode = "v", desc = "Selection (cwd)" }, --Util.telescope("grep_string"), mode = "v", desc = "Selection (root dir)"
      { "<leader>sW", mode = "v", false }, --Util.telescope("grep_string", { cwd = false }), mode = "v", desc = "Selection (cwd)"
      {
        "<leader>uC",
        false,
      },
      -- Util.telescope("colorscheme", { enable_preview = true }),
      -- desc = "Colorscheme with preview",
      { "<leader>ss", false },
      { "<leader>sS", false },
      -- {
      --   "<leader>ss",
      --   function()
      --     require("telescope.builtin").lsp_document_symbols({
      --       symbols = require("lazyvim.config").get_kind_filter(),
      --     })
      --   end,
      --   desc = "Goto Symbol",
      -- },
      -- {
      --   "<leader>sS",
      --   function()
      --     require("telescope.builtin").lsp_dynamic_workspace_symbols({
      --       symbols = require("lazyvim.config").get_kind_filter(),
      --     })
      --   end,
      --   desc = "Goto Symbol (Workspace)",
      -- },
    },
  },
}
