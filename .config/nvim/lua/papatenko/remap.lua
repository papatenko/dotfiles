vim.g.mapleader = " "
local map = vim.keymap.set

-- Quiting Neovim
map("n", "<C-q>", ":q<CR>")

-- Navigating Windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-l>", "<C-w>l")

-- Saving and Exiting
map("n", "<leader>q", vim.cmd.q)
map("n", "<leader>w", vim.cmd.w)
map("n", "<leader>e", vim.cmd.wq)
map("n", "<leader>s", vim.cmd.so)

-- Buffers Navigation
map("n", "<leader>bd", vim.cmd.bd)
map("n", "<leader>bn", vim.cmd.bn)
map("n", "<leader>bp", vim.cmd.bp)
map("n", "<leader>bvs", ":vert sb ")
map("n", "<leader>bsp", ":sb ")

-- Useful ThePrimeagon Keybinds
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "<leader>pv", vim.cmd.Ex)

-- Other
map("n", "Z", ":")
