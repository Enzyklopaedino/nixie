local dependencies = {
    "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "rcarriga/nvim-dap-ui",
}

return {
    {
        "mfussenegger/nvim-dap",
        event = "BufWinEnter",
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },

        event = "BufWinEnter",
        opts = {},
    },

    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },

        event = "BufWinEnter",

        opts = {},
    },

    {
        "mfussenegger/nvim-dap-python",
        dependencies = dependencies,

        ft = "python",

        config = function()
            require("dap-python").setup("uv")
        end,
    },

    {
        "leoluz/nvim-dap-go",

        ft = "go",

        opts = {}
    }
}
