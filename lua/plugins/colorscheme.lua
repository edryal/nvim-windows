-- return {
--     "Mofiqul/dracula.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         -- Make sure to set the color scheme when neovim loads and configures the dracula plugin
--         vim.cmd.colorscheme "dracula"
--     end
-- }

-- return {
--     "vague2k/vague.nvim",
--     priority = 1000,
--     config = function()
--         require("vague").setup({
--             transparent = false,
--             style = {
--                 -- "none" is the same thing as default. But "italic" and "bold" are also valid options
--                 boolean = "bold",
--                 number = "none",
--                 float = "none",
--                 error = "bold",
--                 comments = "italic",
--                 conditionals = "none",
--                 functions = "none",
--                 headings = "bold",
--                 operators = "none",
--                 strings = "italic",
--                 variables = "none",
--
--                 -- keywords
--                 keywords = "none",
--                 keyword_return = "italic",
--                 keywords_loop = "none",
--                 keywords_label = "none",
--                 keywords_exception = "none",
--
--                 -- builtin
--                 builtin_constants = "bold",
--                 builtin_functions = "none",
--                 builtin_types = "bold",
--                 builtin_variables = "none",
--             },
--             plugins = {
--                 cmp = {
--                     match = "bold",
--                     match_fuzzy = "bold",
--                 },
--                 dashboard = {
--                     footer = "italic",
--                 },
--                 lsp = {
--                     diagnostic_error = "bold",
--                     diagnostic_hint = "none",
--                     diagnostic_info = "italic",
--                     diagnostic_warn = "bold",
--                 },
--                 neotest = {
--                     focused = "bold",
--                     adapter_name = "bold",
--                 },
--                 telescope = {
--                     match = "bold",
--                 },
--             },
--         })
--
--         vim.cmd.colorscheme "vague"
--     end
-- }

return {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
        require("rose-pine").setup({
            variant = "moon",      -- auto, main, moon, or dawn (light)
            dark_variant = "moon", -- main, moon, or dawn (light)
            dim_inactive_windows = false,
            extend_background_behind_borders = true,

            enable = {
                terminal = true,
                legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                migrations = true,        -- Handle deprecated options automatically
            },

            styles = {
                bold = true,
                italic = true,
                transparency = false,
            },

            groups = {
                border = "muted",
                link = "iris",
                panel = "surface",

                error = "love",
                hint = "iris",
                info = "foam",
                note = "pine",
                todo = "rose",
                warn = "gold",

                git_add = "foam",
                git_change = "rose",
                git_delete = "love",
                git_dirty = "rose",
                git_ignore = "muted",
                git_merge = "iris",
                git_rename = "pine",
                git_stage = "iris",
                git_text = "rose",
                git_untracked = "subtle",

                h1 = "iris",
                h2 = "foam",
                h3 = "rose",
                h4 = "gold",
                h5 = "pine",
                h6 = "foam",
            },

            palette = {
                -- Override the builtin palette per variant
                -- moon = {
                --     base = '#18191a',
                --     overlay = '#363738',
                -- },
            },

            -- highlight_groups = {
            --     -- Java specific highlights
            --     ["@variable.java"] = { fg = "rose" },
            --     ["@field.java"] = { fg = "iris" },
            --     ["@constructor.java"] = { fg = "pine" },
            --     ["@method.java"] = { fg = "foam" },
            --     ["@parameter.java"] = { fg = "text" },
            --     ["@keyword.java"] = { fg = "pine", italic = true },
            --     ["@string.java"] = { fg = "gold" },
            --     ["@comment.java"] = { fg = "muted", italic = true },
            --     ["@type.java"] = { fg = "foam" },
            --     ["@constant.java"] = { fg = "gold", bold = true },
            --     ["@annotation.java"] = { fg = "iris" },
            -- }
        })

        vim.cmd.colorscheme "rose-pine"
    end
}

-- return {
--     "rebelot/kanagawa.nvim",
--     priority = 1000,
--     config = function()
--         require('kanagawa').setup({
--             compile = true,
--             undercurl = true,
--             commentStyle = { italic = true },
--             functionStyle = {},
--             keywordStyle = { italic = true },
--             statementStyle = { bold = true },
--             typeStyle = {},
--             transparent = false,
--             dimInactive = false,
--             terminalColors = true,
--             colors = {
--                 palette = {},
--                 theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
--             },
--             overrides = function(colors)
--                 return {}
--             end,
--             theme = "wave",
--             background = {
--                 dark = "wave",
--                 -- light = "lotus"
--             },
--         })
--
--         vim.cmd.colorscheme "kanagawa"
--     end
-- }

-- return {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000,
--     config = function()
--         -- latte, frappe, macchiato, mocha
--         vim.cmd.colorscheme "catppuccin"
--     end
-- }

-- return {
-- 	"olimorris/onedarkpro.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("onedarkpro").setup({
-- 			plugins = {
-- 				nvim_tree = false,
-- 			},
-- 		})
--
-- 		vim.cmd.colorscheme("onedark")
-- 	end,
-- }
