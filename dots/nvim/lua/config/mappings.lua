local map = vim.keymap.set

-- ====================================================================
-- lsp
-- ====================================================================

map("n", "gd", vim.lsp.buf.definition, { silent = true })
map("n", "gi", vim.lsp.buf.implementation, { silent = true })

-- ====================================================================
-- move selection
-- ====================================================================

map('v', 'K', ":m '<-2<CR>gv=gv")
map('v', 'J', ":m '>+1<CR>gv=gv")

-- ====================================================================
-- jump between quickfix diagnostics
-- ====================================================================

map('n', '<C-j>', ':cnext<CR>', { silent = true })
map('n', '<C-k>', ':cprev<CR>', { silent = true })

-- ====================================================================
-- oil
-- ====================================================================

map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map("n", "_", "<CMD>Oil .<CR>", { desc = "Open root directory" })

-- ====================================================================
-- telescope
-- ====================================================================

map("n", "<leader>ts", ":Telescope <CR>", { desc = "Open telescope directory" })
map("n", "<leader>fg", ":Telescope live_grep <CR>", { noremap = true, silent = true })
map("n", "<leader>ff", ":Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>", { silent = true })
map("n", "<leader>ng", ":Neogit <CR>", { silent = true })

-- ====================================================================
-- dap
-- ====================================================================

map("n", "<leader>db", function()
    require("dap").toggle_breakpoint()
end)

map("n", "<leader>dc", function()
    require("dap").continue()
end)

map("n", "<leader>de", function()
    require("dapui").eval()
end)

map("n", "<leader>dr", ":DapToggleRepl<CR>")

map("n", "<leader>do", function()
    require("dap").step_over()
end)

map("n", "<leader>di", function()
    require("dap").step_into()
end)

map("n", "<leader>dO", function()
    require("dap").step_out()
end)

map("n", "<leader>dq", function()
    local dap = require("dap")

    dap.terminate()
    dap.virtual_text_toggle()
end)

map("n", "<leader>du", function()
    require("dapui").toggle()
end)
