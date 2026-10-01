require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

vim.keymap.set("n", "<leader>t", function()
  vim.cmd("vsplit")
  vim.cmd("terminal")
  vim.cmd("wincmd =")
end, { desc = "Vertical terminal (50/50)" })

vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

-- vim.keymap.set("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Close buffer" })
