-- Local variables
local opts = { noremap = true, silent = true }

-- Leader Key
vim.g.mapleader = " "

-- Easier to do simple things
vim.keymap.set("i", "jk", "<Esc>", opts)
vim.keymap.set("n", "q:", "<Nop>", opts)
vim.keymap.set("n", "<C-z>", vim.cmd.redo, opts)
vim.keymap.set("n", "<C-s>", vim.cmd.write, opts)

-- Blank Line Normal mode
vim.keymap.set("n", "<CR>", "o<Esc>", opts)
vim.keymap.set("n", "<S-CR>", "O<Esc>", opts)

-- Find And Replace
-- wb: to make the cursor to the beginning of the word so it just look nicer
vim.keymap.set("n", "<C-l>", "wb:%s/<C-r><C-w>//g<Left><Left>", opts)
-- TODO: add mapping to change specific lines
vim.keymap.set("x", "<C-l>", 'y:%s/<C-r>"//g<Left><Left>', opts)

-- Use `\t` to open the previous buffer
vim.keymap.set("n", "<Leader><Tab>", "<C-^>", { noremap = true, silent = true, desc = "Switch buffer" })
