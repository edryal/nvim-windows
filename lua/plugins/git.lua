return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
			vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { desc = "[G]it Preview [H]unk" })
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gb", ":Git blame<cr>", { desc = "[G]it [B]lame" })
			vim.keymap.set("n", "<leader>gp", "Git push", { desc = "[G]it [P]ush" })
		end,
	},
	{
		"sindrets/diffview.nvim",
		config = function()
			Diffview_Toggle = function()
				local lib = require("diffview.lib")
				local view = lib.get_current_view()
				if view then
					vim.cmd.DiffviewClose()
				else
					vim.cmd.DiffviewOpen()
				end
			end
			vim.keymap.set("n", "<leader>pd", Diffview_Toggle, { desc = "[P]review Git [D]iff" })
		end,
	},
}
