local g          = vim.g
local o          = vim.opt

o.clipboard      = "unnamedplus" -- use system clipboard
o.incsearch      = true

o.relativenumber = true -- show relative line numbers
o.scrolloff      = 30   -- always maintain space below cursor
o.nu             = true -- show actual line number instead of 0 for current line

o.tabstop        = 4
o.softtabstop    = 4
o.shiftwidth     = 4
o.expandtab      = true

o.undodir        = vim.fn.expand('~/.nvim/undodir')
o.undofile       = true

o.laststatus     = 0 -- disable default status line

g.mapleader      = ' '

o.conceallevel   = 2

-- dap icons
vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#f38ba8", })
vim.fn.sign_define("DapBreakpoint", {
    text = "󰬉",
    texthl = "DapBreakpoint",
})

vim.api.nvim_set_hl(0, "DapStopped", { fg = "#a6e3a1" })
