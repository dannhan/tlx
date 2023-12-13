return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			keymaps = {
				["l"] = "actions.select",
				["h"] = "actions.parent",
				["q"] = "actions.close",
				["."] = "actions.cd",
				["zh"] = "actions.toggle_hidden",
				["g?"] = "actions.show_help",
				["<C-p>"] = "actions.preview",
			},
		})
	end,
}
