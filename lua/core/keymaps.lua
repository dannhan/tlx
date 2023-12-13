-- Basic Keymappings
vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<C-z>", vim.cmd.redo)

-- Find And Replace
vim.keymap.set("n", "<Leader>l", "wb:%s/<C-r><C-w>/", { silent = true })
vim.keymap.set("n", "<C-l>", "wb:%s/<C-r><C-w>/", { silent = true })

-- Use `\t` to open the previous buffer
vim.keymap.set("n", "<Leader><Tab>", ":b#<CR>", { noremap = true, silent = true })

-- Oil
vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "FileExplorer" })

-- Conform
vim.keymap.set(
	"n",
	"<C-i>",
	[[:w<CR>:lua require("conform").format({ bufnr = vim.fn.bufnr() })<CR>]],
	{ noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<C-s-i>",
	[[:w<CR>:lua require("conform").format({ bufnr = vim.fn.bufnr() })<CR>]],
	{ noremap = true, silent = true }
)
