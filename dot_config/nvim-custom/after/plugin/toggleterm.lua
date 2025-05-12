local status_ok, toggleterm = pcall(require, "toggleterm")

-- Settings
toggleterm.setup({
    open_mapping=[[<C-t>]],
    direction="float",
    shade_terminals=true,
})

local Terminal  = require('toggleterm.terminal').Terminal

-- Lazygit terminals
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
function _lazygit_toggle()
    lazygit:toggle()
end
vim.api.nvim_set_keymap("n", "<C-g>", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

-- Htop terminal (yes I know C-h has it's own keybind in vim but I have a higher chance of becoming barak obama than using that that keybind)
local htop = Terminal:new({ cmd = "htop", hidden = true })
function _htop_toggle()
    htop:toggle()
end
vim.api.nvim_set_keymap("n", "<C-h>", "<cmd>lua _htop_toggle()<CR>", {noremap = true, silent = true})
