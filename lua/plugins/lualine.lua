return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        -- Custom function to check for macro recording
        local macro_recording = function()
            local reg = vim.fn.reg_recording()
            if reg ~= "" then
                return "Recording @" .. reg
            end
            return ""
        end

        require("lualine").setup({
            options = {
                -- Use web devicons if you have a nerdfont installed
                icons_enabled = true,
                theme = "rose-pine",
                -- component_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },

                -- Disable lualine for specific filetypes
                disabled_filetypes = {
                    statusline = {
                        "NvimTree", "DiffviewFiles", "dap-repl", "dapui_console", "dapui_watches", "dapui_scopes",
                        "dapui_breakpoints", "dapui_stacks"
                    },
                    winbar = {},
                },
                ignore_focus = { "NvimTree", "DiffviewFiles", "dap-repl", "dapui_console", "dapui_watches", "dapui_scopes", "dapui_breakpoints", "dapui_stacks" },

                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 500,
                    tabline = 1000,
                    winbar = 1000,
                },
            },

            sections = {
                lualine_a = { "mode" },
                lualine_b = {
                    "branch",
                    "diff",
                    "diagnostics",
                    { macro_recording, color = { fg = "#ff9e64" }, draw_empty = false },
                },
                lualine_c = { "filename" },
                lualine_x = { "filetype", "lsp_status" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {},
        })
    end,
}
