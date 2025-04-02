return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require("dap")

        local dapui = require("dapui")
        dapui.setup()

        local dbxreference = require('lspconfig.util').find_git_ancestor(vim.loop.cwd())
        local java_path = "C:\\Program Files\\Java\\"
        dap.configurations.java = {
            -- Custom & project specific configurations
            {
                name = "Launch & debug reference-server",
                type = "java",
                request = "launch",

                cwd = dbxreference .. "\\dbxreferenceserver",
                mainClass = "com.iongroup.dbx.anagrafe.server.DbxReferenceServerMain",

                javaExec = java_path .. "jdk-17\\bin\\java",
                vmArgs = "-Dconfig.file=" .. dbxreference .. "\\dbxreferenceserver\\mkv.jinit",
            },
            {
                name = "Launch & debug reference-api-wrapper",
                type = "java",
                request = "launch",

                cwd = dbxreference .. "\\dbxreferenceapiwrapper",
                mainClass = "com.iongroup.dbx.anagrafe.dbxreferenceapiwrapper.ApiWrapperMain",

                javaExec = java_path .. "jdk-17\\bin\\java",
                vmArgs = "-Dconfig.file=" .. dbxreference .. "\\dbxreferenceapiwrapper\\mkv.jinit",
            },

            -- Generic java configurations
            {
                type = "java",
                request = "launch",
                name = "Debug & launch application",
                vmArgs = "-Xmx2g "
            },
            {
                type = "java",
                request = "attach",
                name = "Debug (Attach :: 8000)",
                hostName = "127.0.0.1",
                port = 8000,
            },
            {
                type = "java",
                request = "attach",
                name = "Debug (Attach :: 5005)",
                hostName = "127.0.0.1",
                port = 5005,
            },
        }

        -- Open dapui when debugger is launched
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end

        vim.keymap.set("n", "<leader>da", dap.toggle_breakpoint, { desc = "[D]ebug [A]dd Breakpoint" })
        vim.keymap.set("n", "<leader>dC", dap.clear_breakpoints, { desc = "[D]ebug [C]lear Breakpoints" })
        vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "[D]ebug [S]tart" })
        vim.keymap.set("n", "<leader>dc", dapui.close, { desc = "[D]ebug UI [C]lose" })
        vim.keymap.set("n", "<leader>do", dapui.open, { desc = "[D]ebug UI [O]pen" })
    end,
}
