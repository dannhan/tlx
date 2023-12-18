return {
	"kevinhwang91/nvim-ufo",
  lazy = false,
	init = function()
		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
		vim.o.foldmethod = "indent"
	end,
	opts = {
		provider_selector = function(_, _, _)
			return { "treesitter", "indent" }
		end,
	},
	dependencies = {
		"kevinhwang91/promise-async",
		"luukvbaal/statuscol.nvim",
	},
}
