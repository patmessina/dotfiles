-- settings - runs before plugins
local set = vim.opt
-- vim.o.termguicolors = true

set.relativenumber = true
set.cursorline = true
-- Keep 3 lines below and above the cursor
set.scrolloff = 3

-- tabs

-- show existing tab with 4 spaces width
set.tabstop = 4
-- when indenting with '>', use 4 spaces width
set.shiftwidth = 4
-- On pressing tab, insert 4 spaces
set.expandtab = true
-- >> and << with indent to next tab, not add/subtract 4 spaces
set.shiftround = true

-- filetypes that want two spaces instead of 4
-- probably could be pairs with filetype and number of spaces desired
local file_types = {
    "asm", -- assmebly
    "awk",
    "hs", -- haskell
    "html",
    "css",
    "js",
    "rst", -- rust
    "sh",
    "zsh",
    "pico8",
    "tex",
    "yml",
    "yaml",
    "rkt", -- scheme
    "lisp", -- commonlisp
    "lua"
}
for _, f in ipairs(file_types) do
    vim.api.nvim_exec("autocmd Filetype " .. f .. " setlocal ts=2 sw=2", false)
end
