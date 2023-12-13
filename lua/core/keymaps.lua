-- Local variables
local opts = { noremap = true, silent = true }

local format = function()
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
	})
end

local open_oil = function()
	vim.cmd.write()
	vim.cmd.Oil()
end

-- Leader Key
vim.g.mapleader = " "

-- Basic Keymappings
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<C-z>", vim.cmd.redo)

-- Find And Replace
vim.keymap.set("n", "<Leader>l", "wb:%s/<C-r><C-w>/", opts)
vim.keymap.set("n", "<C-l>", "wb:%s/<C-r><C-w>/", opts)

-- Use `\t` to open the previous buffer
vim.keymap.set("n", "<Leader><Tab>", ":b#<CR>", opts)

-- Oil
vim.keymap.set("n", "<leader>e", open_oil, opts)

-- Code format with <C-i>
vim.keymap.set("n", "<C-i>", format, opts)
