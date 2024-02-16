-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, slient = true }

-- deleting keymap that don't need
keymap.del("n", "<leader>l")
-- keymap.del("n", "<leader><space>")
-- keymap.del("n", "<leader>/")
keymap.del("n", "H")
keymap.del("n", "L")

-- changing default keymap
keymap.set("n", "<C-n>", ":m .+1<CR>==")
keymap.set("n", "<C-m>", ":m .-2<CR>==")

keymap.set("n", "<CR>", "o<esc>")
keymap.set("n", "<S-CR>", "O<esc>")
-- page UP and Down
keymap.set("n", "<C-j>", "<PageDown>")
keymap.set("n", "<C-k>", "<PageUp>")

-- inserting keymap

keymap.set("i", "<esc>", "<cmd>stopinsert<cr>")

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- deleting word backword
keymap.set("n", "dub", "vg_d", { desc = "deleting until back" })
keymap.set("n", "duf", "v0d", { desc = "deleting unitl front" })

-- select all

keymap.set("n", "sa", "gg<S-v>G", { desc = "select all" })

-- oil
keymap.set("n", "<leader>e", function()
  require("oil").toggle_float()
end, { desc = "Toggle Explorer oil" })

-- Vim Illuminate keybinds
keymap.set("n", "<leader>[", function()
  require("illuminate").goto_next_reference()
  vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Illuminate: Goto next reference" })

keymap.set("n", "<leader>]", function()
  require("illuminate").goto_prev_reference()
  vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Illuminate: Goto previous reference" })

-- spectre and chnangin words
-- Press 'S' for quick find/replace for the word under the cursor
keymap.set("n", "R", function()
  local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
  local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
end)

-- Open Spectre for global find/replace
keymap.set("n", "<leader>R", function()
  require("spectre").toggle()
end)

-- Setting up gomove keymap if gomove is installed
if vim.fn.exists("nvim-gomove") then
  print("package loaded")
  keymap.set("n", "<C-n>", "<Plug>GoNSMDown", { desc = "Move Line Up" })
  keymap.set("n", "<C-m>", "<Plug>GoNSMUp", { desc = "Move Line Down" })

  keymap.set("x", "<C-n>", "<Plug>GoVSMDown", { desc = "Move Lines Up" })
  keymap.set("x", "<C-m>", "<Plug>GoVSMUp", { desc = "Move Lines Down" })
end
