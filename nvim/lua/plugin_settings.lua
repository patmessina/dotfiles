-- color
vim.cmd[[colorscheme neon]]
vim.g.neon_style = "doom"


-- statusline
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'neon'
    -- ... your lualine config
  }
}


-- telescope
local map = vim.api.nvim_set_keymap
local options = {noremap = true}
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', options)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', options)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', options)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', options)


-- trouble
vim.keymap.set("n", "<leader>xx",
  "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xw",
  "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xd",
  "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xl",
  "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xq",
  "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true})
vim.keymap.set("n", "gR",
  "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true})

-- null-ls
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local null_ls = require("null-ls")

local sources = {
  null_ls.builtins.diagnostics.pylint,
  null_ls.builtins.completion.spell,
}
null_ls.setup(sources)


-- lsp
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.nvim_workspace()

lsp.configure('gdscript', {
  force_setup = true
})

-- copilot
-- lsp takes over copilot -- so need to unmap the tab
vim.g.copilot_assume_mapped = true
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-u>", 'copilot#Accept("<CR>")', {
  silent = true,
  expr = true
})

lsp.setup()
