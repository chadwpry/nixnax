require("nvchad.mappings")

-- add yours here
local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("v", "<Leader>sa", ":sort<enter>")
map("v", "<Leader>sd", ":sort!<enter>")
map("v", "<Leader>su", ":sort u<enter>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
