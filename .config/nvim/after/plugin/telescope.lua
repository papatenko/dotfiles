local builtin = require('telescope.builtin')

-- General Keybinds
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})

-- Git File Search
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
