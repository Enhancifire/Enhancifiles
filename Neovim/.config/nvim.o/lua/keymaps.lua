-- Set leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true })

vim.g.mapleader = ' '

-- remap to ESC
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', { noremap = true, silent = true })

-- Navigate Windows
vim.api.nvim_set_keymap('n', '<Leader>wh', ':wincmd h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wj', ':wincmd j<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wk', ':wincmd k<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wl', ':wincmd l<CR>', { noremap = true, silent = true })

-- Split Windows
vim.api.nvim_set_keymap('n', '<Leader>ws', ':sp <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wv', ':vs <CR>', { noremap = true, silent = true })

-- Close Window
vim.api.nvim_set_keymap('n', '<Leader>wc', ':close <CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>op', ':Lexplore <CR>', { noremap = true, silent = true })

nmap('<Leader>ff', 'lua require('telescope.builtin')')
