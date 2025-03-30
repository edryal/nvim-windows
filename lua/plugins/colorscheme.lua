-- return {
--     "Mofiqul/dracula.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         -- Make sure to set the color scheme when neovim loads and configures the dracula plugin
--         vim.cmd.colorscheme "dracula"
--     end
-- }

return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        -- latte, frappe, macchiato, mocha
        vim.cmd.colorscheme "catppuccin"
    end
}

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
