-- optionally enable 24-bit colour
-- vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("config.options")
require("lazy").setup("plugins", require("config.lazy"))

vim.schedule(function()
    vim.filetype.add(require("config.filetypes"))

    require("config.mappings")
    require("config.autocmds")
end)

require("config.theme")

-- Add the mason binary path to the PATH variable, so that plugins, such as
-- conform, can use the mason binaries.
local function configure_mason_path()
    local is_windows = vim.fn.has "win32" ~= 0
    local sep = is_windows and "\\" or "/"
    local delim = is_windows and ";" or ":"
    vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep)
        .. delim
        .. vim.env.PATH
end
configure_mason_path()

if vim.fn.argc() == 0 then
    -- nvim has been called without additional argumnets -> start oil
    vim.cmd(":silent exec ':Oil'")
end

-- Do not create backup files. Otherwise, rsbuild will go crazy.
vim.opt.backup = false
vim.opt.writebackup = false
