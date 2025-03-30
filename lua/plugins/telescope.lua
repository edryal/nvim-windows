return {
    {
        "nvim-telescope/telescope.nvim",
        commit = "a0bbec2",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "andrew-george/telescope-themes",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            local telescope = require("telescope")
            telescope.load_extension("themes")
            telescope.load_extension("fzf")

            telescope.setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = " ",
                    layout_strategy = "horizontal",
                    preview = true,
                    path_display = {
                        "smart",
                    },
                    layout_config = {
                        height = 0.8,
                        width = 0.85,
                    },
                    file_ignore_patterns = {
                        "node%_modules/.*",
                        "target/.*",
                    },
                },
                pickers = {
                    find_files = {
                        layout_strategy = "vertical",
                        preview = false,
                    },
                    -- live_grep = {
                    -- 	layout_strategy = "horizontal",
                    -- 	preview = true,
                    -- },
                    -- git_stash = {
                    -- 	layout_strategy = "horizontal",
                    -- 	preview = true,
                    -- },
                },
            })

            local builtin = require("telescope.builtin")
            function fuzzyFindFiles()
                builtin.grep_string({
                    path_display = { "smart" },
                    only_sort_text = true,
                    word_match = "-w",
                    search = "",
                })
            end

            vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Buffers" })
            vim.keymap.set("n", "<leader>sl", '<cmd>lua fuzzyFindFiles{}<cr>', { desc = "[S]earch by [L]ive Grep" })
            vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
            vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earcher [R]esume" })
            vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
            vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
            vim.keymap.set("n", "<leader>so", vim.diagnostic.open_float, { desc = "[O]pen Floating Diagnostics" })
            vim.keymap.set("n", "<leader>sb", builtin.current_buffer_fuzzy_find, { desc = "[S]earch [B]uffer" })
            -- vim.keymap.set("n", "<leader>sg", builtin.git_files, { desc = "[S]earch [G]it Files" })

            vim.keymap.set("n", "<leader>pb", builtin.git_branches, { desc = "[P]review Git [B]ranches" })
            vim.keymap.set("n", "<leader>ps", builtin.git_stash, { desc = "[P]review Git [S]tashes" })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            -- get access to telescopes navigation functions
            local actions = require("telescope.actions")

            require("telescope").setup({
                -- use ui-select dropdown as our ui
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
                -- set keymappings to navigate through items in the telescope io
                mappings = {
                    i = {
                        -- use <cltr> + n to go to the next option
                        ["<C-n>"] = actions.cycle_history_next,
                        -- use <cltr> + p to go to the previous option
                        ["<C-p>"] = actions.cycle_history_prev,
                        -- use <cltr> + j to go to the next preview
                        ["<C-j>"] = actions.move_selection_next,
                        -- use <cltr> + k to go to the previous preview
                        ["<C-k>"] = actions.move_selection_previous,
                    },
                },
                -- load the ui-select extension
                require("telescope").load_extension("ui-select"),
            })
        end,
    },
}
