return {
    {
        "rcasia/neotest-java",
        ft = "java",
        dependencies = {
            "mfussenegger/nvim-jdtls",
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-java")({
                        incremental_build = true,
                    })
                    -- other adapters
                },
                default_strategy = "integrated",
            })

            vim.keymap.set("n", "<leader>tm", "<cmd>lua require('neotest').run.run()<cr>", { desc = "[T]est Nearest [M]ethod", noremap = true })
            vim.keymap.set("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", { desc = "[T]est Entire [F]ile", noremap = true })
            vim.keymap.set("n", "<leader>td", "<cmd>lua require('neotest').run.run({ strategy = 'dap' })<cr>", { desc = "[T]est And [D]ebug Method", noremap = true })
        end
    },
}
