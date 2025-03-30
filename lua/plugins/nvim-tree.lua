local function custom_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "<leader>e", api.tree.toggle, { desc = "Toggle [E]xplorer" })
	vim.keymap.set("n", "<leader>o", api.tree.find_file, { desc = "[O]pen file location" })
end

return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			git = {
				enable = false,
			},
			view = {
				adaptive_size = true,
			},
			hijack_netrw = true,
			auto_reload_on_write = true,
            modified = {
                enable = true,
            },
			renderer = {
				group_empty = true,
                highlight_modified = "name",
			},
            actions = {
                expand_all = {
                    exclude = {
                        { "target" },
                    },
                },
            },
			on_attach = custom_attach,
		})
	end,
}
