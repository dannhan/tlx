-- Main Options
vim.opt.number 		      = true                  -- shows current line number

vim.opt.completeopt     = "menu,menuone,noselect" -- Better autocompletion
vim.opt.pumheight       = 10                      --- Max num of items in completion menu
vim.opt.relativenumber 	= true                  -- enables relative number
vim.opt.clipboard 	    = "unnamed,unnamedplus" -- copy-paste outside vim
vim.opt.cursorline     	= true                  -- highlight current line
vim.opt.expandtab      	= true                  -- use space instead of tabs
vim.opt.laststatus     	= 3                     -- global statusline
vim.opt.scrolloff      	= 8                     -- keep space when scrolling
vim.opt.shiftwidth     	= 2                     -- 
vim.opt.swapfile       	= false                 -- swap not needed
vim.opt.tabstop        	= 2                     -- insert 2 space for a tab
vim.opt.undofile       	= true                  -- 
vim.opt.wrap           	= false                 -- 
vim.opt.termguicolors   = true                  -- 
vim.opt.signcolumn      = "yes:2"               -- add extra sign column
vim.opt.pumheight       = 10                    -- max num of items in completion menu
vim.opt.wildignore     = "*node_modules/**"     -- don't search inside Node.js modules (works for gutentag)
vim.opt.splitright     = true                   -- vertical splits will automatically be to the right

-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.cmd.highlight("GitSignsAdd guibg=NONE")
vim.cmd.highlight("GitSignsChange guibg=NONE")
vim.cmd.highlight("GitSignsDelete guibg=NONE")
vim.cmd.highlight("SignColumn guibg=NONE")

-- sign icons
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError", numhl = "" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", numhl = "" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint", numhl = "" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", numhl = "" })

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local path  = "/home/anibaw/.config/nvim/init.lua"
    local text  = 'vim.cmd.colorscheme("' .. vim.g.colors_name .. '")'
    local lines = vim.fn.readfile(path)

    table.remove(lines, #lines)
    vim.fn.writefile(lines, path)

    table.insert(lines, text)
    vim.fn.writefile(lines, path)

    vim.api.nvim_set_hl(0, "illuminatedWord", { fg = "#063970", bg = "#76b5c5" })
    vim.api.nvim_set_hl(0, "LspReferenceText", { fg = "#063970", bg = "#76b5c5" })
    vim.api.nvim_set_hl(0, "LspReferenceWrite", { fg = "#063970", bg = "#76b5c5" })
    vim.api.nvim_set_hl(0, "LspReferenceRead", { fg = "#063970", bg = "#76b5c5" })
  end,
})
