return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = { "stylua" },
            })

            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls", "jdtls" },
            })
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = { "java-debug-adapter", "java-test" },
            })

            require("mason-nvim-dap").setup({
                ensure_installed = { "java-debug-adapter", "java-test" },
            })
        end,
    },
    {
        "mfussenegger/nvim-jdtls",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local builtin = require("telescope.builtin")

            -- Resolve lua-language-server package
            local mason_registry = require("mason-registry")
            local lua_ls = mason_registry.get_package("lua-language-server")
            local lua_ls_path = lua_ls:get_install_path()

            -- Lua
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                cmd = {
                    -- Sometimes lspconfig can't find lua_ls, so I explicitly point it to the right executable
                    lua_ls_path .. "\\bin\\lua-language-server.exe"
                },
            })

            -- Typescript
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })

            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
            vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
            vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
            vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[C]ode Goto [D]efinition" })
            vim.keymap.set("n", "<leader>cr", builtin.lsp_references, { desc = "[C]ode Goto [R]eferences" })
            vim.keymap.set("n", "<leader>ci", builtin.lsp_implementations, { desc = "[C]ode Goto [I]mplementations" })
            vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })
        end,
    },
}
