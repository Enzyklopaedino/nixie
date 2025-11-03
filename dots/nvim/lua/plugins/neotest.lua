return {
    "nvim-neotest/neotest",
    event = "BufWinEnter",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter"
    },
    opts = function()
        return {
            adapters = {
                ['neotest-jdtls'] = function()
                    return require('neotest-jdtls')
                end,
            },
        }
    end,
}
