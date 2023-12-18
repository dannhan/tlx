return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			sections = {
				lualine_c = {
					{
						"filename",
						file_status = true, -- displays file status (readonly status, modified status)
						path = 1, -- relative path
						shorting_target = 40, -- Shortens path to leave 40 space in the window
					},
				},
			},
		})
	end,
}
