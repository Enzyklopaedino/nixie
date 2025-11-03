return {
    {
        "L3MON4D3/LuaSnip",

        config = function()
            require("luasnip.loaders.from_lua").load()
            require("luasnip.loaders.from_lua").lazy_load {
                paths = vim.g.lua_snippets_path or "",
            }
        end,
    },
    {
        "saghen/blink.cmp",

        version = "1.*",
        build = "nix run --accept-flake-config .#build-plugin",

        dependencies = {
            "rafamadriz/friendly-snippets",
        },

        event = "BufWinEnter",

        --- @module "blink.cmp"
        --- @type blink.cmp.Config
        opts = {
            keymap = { preset = "enter" },

            appearance = {
                nerd_font_variant = "mono",

                use_nvim_cmp_as_default = false,

                kind_icons = {
                    Text = "󰉿",
                    Method = "󰆧",
                    Function = "󰊕",
                    Constructor = "",
                    Field = "󰜢",
                    Variable = "󰀫",
                    Class = "󰠱",
                    Interface = "",
                    Module = "",
                    Property = "󰜢",
                    Unit = "󰑭",
                    Value = "󰎠",
                    Enum = "",
                    Keyword = "󰌋",
                    Snippet = "",
                    Color = "󰏘",
                    File = "󰈙",
                    Reference = "󰈇",
                    Folder = "󰉋",
                    EnumMember = "",
                    Constant = "󰏿",
                    Struct = "󰙅",
                    Event = "",
                    Operator = "󰆕",
                    TypeParameter = "",
                    Copilot = "",
                }
            },

            completion = {
                documentation = {
                    auto_show = true,        -- Enable automatic documentation display
                    auto_show_delay_ms = 50, -- Small delay to avoid flickering
                    update_delay_ms = 50,    -- Quick updates when navigating
                    window = {
                        border = "rounded",
                        max_width = 80,  -- Reasonable width for documentation
                        max_height = 20, -- Prevent huge documentation windows
                        winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder",
                    }
                },

                menu = {
                    border = "rounded",
                    winhighlight =
                    "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",

                    scrolloff = 0,
                    scrollbar = false,

                    draw = {
                        columns = {
                            { "label",     "label_description", gap = 1 },
                            { "kind_icon", "kind",              gap = 1 },
                        },

                        treesitter = { "lsp" },

                        padding = 1,
                    },
                },
            },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },

            fuzzy = { implementation = "prefer_rust" },

            signature = {
                enabled = true,
                window = {
                    border = "rounded",
                    winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
                }
            },
        },

        opts_extend = { "sources.default" },

        config = function(_, opts)
            require("blink.cmp").setup(opts)

            local catppuccin_colors = require("catppuccin.palettes").get_palette("mocha")

            -- main completion menu with darker, more elegant Mocha colors
            vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = catppuccin_colors.base, fg = catppuccin_colors.text })
            vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = catppuccin_colors.base, fg = catppuccin_colors.blue })
            vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection",
                { bg = catppuccin_colors.surface0, fg = catppuccin_colors.text, bold = true })

            -- documentation window with subtle contrast
            vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = catppuccin_colors.mantle, fg = catppuccin_colors.subtext1 })
            vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { bg = catppuccin_colors.mantle, fg = catppuccin_colors.blue })

            -- signature help with consistent styling
            vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelp",
                { bg = catppuccin_colors.mantle, fg = catppuccin_colors.subtext1 })
            vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder",
                { bg = catppuccin_colors.mantle, fg = catppuccin_colors.blue })

            -- kind-specific highlights with Mocha's vibrant accent colors
            vim.api.nvim_set_hl(0, "BlinkCmpKindText", { fg = catppuccin_colors.subtext1 })
            vim.api.nvim_set_hl(0, "BlinkCmpKindMethod", { fg = catppuccin_colors.sapphire })
            vim.api.nvim_set_hl(0, "BlinkCmpKindFunction", { fg = catppuccin_colors.blue })
            vim.api.nvim_set_hl(0, "BlinkCmpKindConstructor", { fg = catppuccin_colors.yellow })
            vim.api.nvim_set_hl(0, "BlinkCmpKindField", { fg = catppuccin_colors.teal })
            vim.api.nvim_set_hl(0, "BlinkCmpKindVariable", { fg = catppuccin_colors.flamingo })
            vim.api.nvim_set_hl(0, "BlinkCmpKindClass", { fg = catppuccin_colors.yellow })
            vim.api.nvim_set_hl(0, "BlinkCmpKindInterface", { fg = catppuccin_colors.peach })
            vim.api.nvim_set_hl(0, "BlinkCmpKindModule", { fg = catppuccin_colors.blue })
            vim.api.nvim_set_hl(0, "BlinkCmpKindProperty", { fg = catppuccin_colors.teal })
            vim.api.nvim_set_hl(0, "BlinkCmpKindKeyword", { fg = catppuccin_colors.mauve })
            vim.api.nvim_set_hl(0, "BlinkCmpKindSnippet", { fg = catppuccin_colors.green })
            vim.api.nvim_set_hl(0, "BlinkCmpKindFile", { fg = catppuccin_colors.sky })
            vim.api.nvim_set_hl(0, "BlinkCmpKindFolder", { fg = catppuccin_colors.sapphire })
            vim.api.nvim_set_hl(0, "BlinkCmpKindConstant", { fg = catppuccin_colors.peach })
            vim.api.nvim_set_hl(0, "BlinkCmpKindCopilot", { fg = catppuccin_colors.green, italic = true })

            -- additional label and description styling for better readability
            vim.api.nvim_set_hl(0, "BlinkCmpLabel", { fg = catppuccin_colors.text })
            vim.api.nvim_set_hl(0, "BlinkCmpLabelDescription", { fg = catppuccin_colors.subtext0, italic = true })
            vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { fg = catppuccin_colors.red, bold = true })
            vim.api.nvim_set_hl(0, "BlinkCmpLabelDetail", { fg = catppuccin_colors.overlay1 })
        end,
    },
}
