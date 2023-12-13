print("Here we go")

return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
		},
	},
	config = function()
		local lsp = require("lsp-zero").preset("recommended")
		lsp.on_attach(function(_, bufnr)
			lsp.default_keymaps({ buffer = bufnr })
		end)
		lsp.set_sign_icons({
			error = "",
			warn = "",
			hint = "",
			information = "",
			other = "",
		})
		lsp.setup()
		vim.diagnostic.config({
			virtual_text = true,
			update_in_insert = false,
		})
		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		local cmp = require("cmp")
		local luasnip = require("luasnip")
		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
		})

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = { "tsserver", "rust_analyzer" },
			handlers = {
				lsp.default_setup,
			},
		})
	end,
}
