return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			finder = { separator = "" },
			winopts = {
				on_create = function()
					vim.keymap.set("t", "<Tab>", "<Down>", { silent = true, buffer = true })
					vim.keymap.set("t", "<S-Tab>", "<Up>", { silent = true, buffer = true })
				end,
			},
			keymap = {
				builtin = { ["<C-h>"] = "toggle-help" },
				fzf = {
					["ctrl-u"] = "unix-line-discard",
					["ctrl-a"] = "beginning-of-line",
					["ctrl-e"] = "end-of-line",
					["alt-a"] = "toggle-all",
				},
			},
			git = {
				icons = {
					["M"] = { icon = "*", color = "yellow" },
					["D"] = { icon = "✗", color = "red" },
					["A"] = { icon = "+", color = "green" },
					["R"] = { icon = "➜", color = "yellow" },
					["C"] = { icon = ">", color = "yellow" },
					["T"] = { icon = "➜", color = "magenta" },
					["?"] = { icon = "?", color = "magenta" },
				},
			},
		})
	end,
	keys = {
		{ "<leader>pf", "<cmd>FzfLua files<CR>", mode = "n", desc = "files" },
		{ "<leader>ps", "<cmd>FzfLua live_grep<CR>", mode = "n", desc = "live grep" },
		{ "<leader>pb", "<cmd>FzfLua buffers<CR>", mode = "n", desc = "buffers" },
		{ "<leader>pt", "<cmd>FzfLua colorschemes<CR>", mode = "n", desc = "colorschemes" },
		{ "<leader>pc", "<cmd>FzfLua files cwd=~/.config/nvim<CR>", mode = "n", desc = "nvim" },
		{ "<leader>pn", "<cmd>FzfLua files cwd=~/Notes<CR>", mode = "n", desc = "nvim" },
	},
}
