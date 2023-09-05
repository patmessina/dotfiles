-- keybindings - runs before plugins

vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap
local options = {noremap = true}

-- next buffer
map('n', '<c-n>', '<cmd>bnext<cr>', options)
map('n', '<c-p>', '<cmd>bprev<cr>', options)

map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<cr>', options)

map('t', '<leader><Esc>', '<C-\\><c-n>', options)

-- navigate splits like a sane person
map('n', '<c-h>', '<C-\\><C-N><C-w>h', options)
map('n', '<c-l>', '<C-\\><C-N><C-w>l', options)
map('n', '<c-k>', '<C-\\><C-N><C-w>k', options)
map('n', '<c-j>', '<C-\\><C-N><C-w>j', options)

map('t', '<c-h>', '<C-\\><C-N><C-w>h', options)
map('t', '<c-l>', '<C-\\><C-N><C-w>l', options)
map('t', '<c-k>', '<C-\\><C-N><C-w>k', options)
map('t', '<c-j>', '<C-\\><C-N><C-w>j', options)


-- When lines wrap, move up as if it is a separate line.
map('n', 'j', 'gj', options)
map('n', 'k', 'gk', options)

-- Format lines that are around current line
map('n', '<leader>q', 'gqip', options)

-- copy
map('v', '<leader>y', '"+y', options)
map('n', '<leader>y', '"+y', options)
map('v', '<leader>Y', '"*y', options)
map('n', '<leader>Y', '"*y', options)

-- paste
map('v', '<leader>p', '"+p', options)
map('n', '<leader>p', '"+p', options)
map('v', '<leader>P', '"*p', options)
map('n', '<leader>P', '"*p', options)

