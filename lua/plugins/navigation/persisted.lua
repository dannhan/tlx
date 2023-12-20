return {
  "olimorris/persisted.nvim",
  opts = {
    save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved
    silent = false,                                                 -- silent nvim message when sourcing session file
    use_git_branch = false,                                         -- create session files based on the branch of the git enabled repository
    autosave = true,                                                -- automatically save session files when exiting Neovim
    should_autosave = nil,                                          -- function to determine if a session should be autosaved
    autoload = true,                                                -- automatically load the session for the cwd on Neovim startup
    on_autoload_no_session = nil,                                   -- function to run when `autoload = true` but there is no session to load
    follow_cwd = true,                                              -- change session file name to match current working directory if it changes
    allowed_dirs = nil,                                             -- table of dirs that the plugin will auto-save and auto-load from
    ignored_dirs = nil,                                             -- table of dirs that are ignored when auto-saving and auto-loading
    telescope = {                                                   -- options for the telescope extension
      reset_prompt_after_deletion = true,                           -- whether to reset prompt after session deleted
    },
  },
  config = function()
    require("persisted").setup()
    vim.keymap.set("n", "<leader>ps", "<cmd>SessionSave<cr>", { silent = true })
    vim.keymap.set("n", "<leader>pd", "<cmd>SessionDelete<cr>", { silent = true })
    vim.keymap.set("n", "<leader>pL", "<cmd>SessionLoadLast<cr>", { silent = true })
    -- vim.keymap.set("n", "<leader>ss", "<cmd>SessionStart<cr>",  { silent = true })
    -- vim.keymap.set("n", "<leader>so", "<cmd>SessionStop<cr>",   { silent = true })
    -- vim.keymap.set("n", "<leader>st", "<cmd>SessionToggle<cr>", { silent = true })
    -- vim.keymap.set("n", "<leader>sl", "<cmd>SessionLoad<cr>",   { silent = true })
  end,
}
