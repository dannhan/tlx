return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"jay-babu/mason-null-ls.nvim",
		"nvimtools/none-ls.nvim",
		"folke/neodev.nvim",
	},
	config = function()
		require("neodev").setup({})
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- vim.api.nvim_create_autocmd("LspAttach", {
		-- 	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		-- 	callback = function(ev)
		-- 		local opts = { buffer = ev.buf }
		-- 		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		-- 		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		-- 		vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
		-- 		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		-- 	end,
		-- })

		require("null-ls").setup({})

		-- LSP SERVER MANAGEMENT
		require("mason").setup({})
		local lspconfig = require("lspconfig")
		lspconfig.tsserver.setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {},
			handlers = {
				function(server)
					require("lspconfig")[server].setup({})
				end,
			},
		})
		require("mason-null-ls").setup({
			capabilities = lsp_capabilities,
			handlers = {},
			ensure_installed = {},
			automatic_installation = {},
		})
	end,
}
