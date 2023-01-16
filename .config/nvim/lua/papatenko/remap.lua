vim.g.mapleader = " "
local map = vim.keymap.set

-- Navigating Windows
map("n", "<leader>h", "<C-w>h")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>l", "<C-w>l")

-- Saving, Quiting, and Exiting
map("n", "<leader>w", vim.cmd.w)
map("n", "<leader>q", vim.cmd.q)
map("n", "<leader>e", vim.cmd.wq)

-- Buffers
map("n", "<leader>d", ":bd ")

-- Splits
map("n", "<leader>b", ":sp<CR><C-w>w")
map("n", "<leader>v", ":vs<CR><C-w>w")

-- Useful ThePrimeagon Keybinds
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Helps releave pain from my left pinky
map("n", "Z", ":")
-- Changes neovim directory to where the buffer is 
map("n", "cd", ":cd %:h<CR>")