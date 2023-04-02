local builtin = require('telescope.builtin')
local map = vim.keymap.set

-- General Keybinds
map('n', '<leader>pf', builtin.find_files, {})
map('n', '<leader>pg', builtin.live_grep, {})
map('n', '<leader>pb', builtin.buffers, {})
map('n', '<leader>ph', builtin.help_tags, {})

-- Git File Search
map('n', '<leader>pg', builtin.git_files, {})
