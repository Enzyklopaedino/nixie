return {
    "stevearc/oil.nvim",
    event = "BufWinEnter",
    cmd = "Oil",
    opts = {
        columns = {
            "icon",
            "size",
        },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
