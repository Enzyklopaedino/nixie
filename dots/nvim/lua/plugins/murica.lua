return {
    "stevearc/oil.nvim",
    event = "BufWinEnter",
    cmd = "Oil",
    opts = {
        columns = {
            "icon",
            "size",
        },
        view_options = {
            show_hidden = true,
            is_always_hidden = function(name, _)
                return name == ".."
            end,
        },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
