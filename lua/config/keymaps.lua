-- Set our leader keybinding to space
-- Anywhere you see <leader> in a keymapping specifies the space key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove search highlights after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- Exit Vim's terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- OPTIONAL: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- set up a vim motion for <Space> + c + f to automatically format our code based on which langauge server is active
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "[C]ode [F]ormat" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Easily split windows
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>", { desc = "[W]indow Split [V]ertical" })
vim.keymap.set("n", "<leader>wh", ":split<cr>", { desc = "[W]indow Split [H]orizontal" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right in visual mode" })

-- Help with whole file selection / yanking
vim.keymap.set("n", "yA", "ggVGy", { desc = "Yank the entire file" })
vim.keymap.set("n", "vA", "ggVG", { desc = "Select the entire file" })

-- Noice
vim.keymap.set("n", "<leader>nl", "<cmd>Noice last<cr>", { desc = "[L]ast Notification", noremap = true })
vim.keymap.set("n", "<leader>nh", "<cmd>Noice history<cr>", { desc = "[H]istory", noremap = true })
vim.keymap.set("n", "<leader>nd", "<cmd>Noice dismiss<cr>", { desc = "[D]ismiss Notification", noremap = true })

-- Compiler
vim.api.nvim_set_keymap("n", "<leader>Co", "<cmd>CompilerOpen<cr>", { desc = "[O]pen", noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>Cr",
	"<cmd>CompilerToggleResults<cr>",
	{ desc = "[R]esults", noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>CR",
	"<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
		.. "<cmd>CompilerRedo<cr>",
	{ desc = "[R]edo last option", noremap = true, silent = true }
)

-- Testing
-- vim.keymap.set("n", "<leader>tc", function()
-- 	if vim.bo.filetype == "java" then
-- 		require("jdtls").test_class()
-- 	end
-- end, { desc = "[T]est [C]lass", noremap = true })
--
-- vim.keymap.set("n", "<leader>tm", function()
-- 	if vim.bo.filetype == "java" then
-- 		require("jdtls").test_nearest_method()
-- 	end
-- end, { desc = "[T]est nearest [M]ethod", noremap = true })

-- Swagger preview
vim.keymap.set("n", "<leader>pt", "<cmd>SwaggerPreviewToggle<cr>", { desc = "Swagger Preview [T]oggle" })
