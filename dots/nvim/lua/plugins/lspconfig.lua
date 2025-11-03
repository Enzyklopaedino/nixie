-- TODO: sign_define() is deprecated
vim.fn.sign_define(
    "DiagnosticSignError",
    { text = "", texthl = "DiagnosticSignError" }
)
vim.fn.sign_define(
    "DiagnosticSignWarn",
    { text = "", texthl = "DiagnosticSignWarn" }
)
vim.fn.sign_define(
    "DiagnosticSignInfo",
    { text = "", texthl = "DiagnosticSignInfo" }
)
vim.fn.sign_define(
    "DiagnosticSignHint",
    { text = "", texthl = "DiagnosticSignHint" }
)

vim.schedule(function()
    local files = vim.api.nvim_get_runtime_file("lua/lsps/*.lua", true)
    for _, file in ipairs(files) do
        local lsp_name = file:match("([^/]+)%.%w+$")

        local module = require("lsps." .. lsp_name)
        if module ~= nil then
            if module.config ~= nil then
                vim.lsp.config(lsp_name, module.config)
            end
            vim.lsp.enable(lsp_name)
        end
    end
end)

return {
    "neovim/nvim-lspconfig",

    event = "BufWinEnter",
}
