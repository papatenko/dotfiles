local set = vim.opt

-- UI
set.relativenumber = true
set.wildmenu = true
set.number = true

-- Tabs
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

-- Search
set.hlsearch = false
set.incsearch = true

-- For Comment plugin
set.timeoutlen = 1000

-- For LSP plugin
set.signcolumn = 'yes'

-- Auto reload file when switching git branches 
-- *Thanks to: https://gitlab.com/jokeyrhyme
set.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = { "*" },
})

-- Other
set.autoindent = true
set.shell = "zsh"
