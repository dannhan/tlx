-- Local variables
local opts = { noremap = true, silent = true }

-- Leader Key
vim.g.mapleader = " "

-------------------------- Basic Keymappings ---------------------------
-- Easier to do simple things
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<C-z>", vim.cmd.redo)
vim.keymap.set("n", "q:", "q:")
-- Blank Line Normal mode
vim.keymap.set("n", "<CR>", "o<Esc>")
vim.keymap.set("n", "<S-CR>", "O<Esc>")
-- Find And Replace
vim.keymap.set("n", "<C-l>", "wb:%s/<C-r><C-w>/", opts)
-- Use `\t` to open the previous buffer
vim.keymap.set("n", "<Leader><Tab>", "<C-^>", opts)
-- Easy Window navigation
vim.keymap.set("n", "<leader>w", "<C-w>", opts)
