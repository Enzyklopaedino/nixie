return {
    'stevearc/conform.nvim',
    event = "BufWritePre",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            go = { "gofmt" },
            markdown = { "mdformat" },
            python = { "ruff_format", "isort", "black" },
            typescript = { "biome", "eslint", "prettier" },
            typescriptreact = { "biome", "eslint", "prettier" },
            javascript = { "biome", "eslint", "prettier" },
            javascriptreact = { "biome", "eslint", "prettier" },
            zig = { "zigfmt" },
        },
        format_on_save = function(bufnr)
            local filetype = vim.bo[bufnr].filetype
            if filetype == "java" then
                return false
            end
            return { timeout_ms = 2500, lsp_fallback = true }
        end,
    },
}
