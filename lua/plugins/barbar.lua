return {}
-- {
-- 	"romgrk/barbar.nvim",
-- 	dependencies = {
-- 		"lewis6991/gitsigns.nvim",
-- 		"nvim-tree/nvim-web-devicons",
-- 	},
-- 	config = function()
-- 		require("barbar").setup({
-- 			animation = false,
-- 			tabpages = true,
-- 			clickable = true,
-- 			no_name_title = "diff",
-- 			sidebar_filetypes = {
-- 				NvimTree = true,
-- 			},
-- 		})
--
-- 		local opts = { noremap = true, silent = true }
--
-- 		vim.keymap.set("n", "<A-q>", "<Cmd>BufferDelete<CR>", opts)
-- 		vim.keymap.set("n", "<A-r>", "<Cmd>BufferRestore<CR>", opts)
-- 		vim.keymap.set("n", "<A-h>", "<Cmd>BufferPrevious<CR>", opts)
-- 		vim.keymap.set("n", "<A-l>", "<Cmd>BufferNext<CR>", opts)
-- 	end,
-- }
