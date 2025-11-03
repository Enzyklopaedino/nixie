-- ====================================================================
-- indentation
-- ====================================================================

vim.api.nvim_create_autocmd("FileType", {
    pattern = "typescript,typescriptreact,javascript,javascriptreact",
    command = "setlocal shiftwidth=2 tabstop=2"
})
