return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				completion = {
					-- menu: display options in a menu
					-- menuone: automatically select the first option of the menu
					-- preview: automatically display the completion candiate as you navigate the menu
					-- noselect: prevent neovim from automatically selecting a completion option while navigating the menu
					competeopt = "menu,menuone,preview,noselect",
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					-- previous suggestion
					["<C-k>"] = cmp.mapping.select_prev_item(),
					-- next suggestion
					["<C-j>"] = cmp.mapping.select_next_item(),

					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),

					-- show completion suggestions
					["<C-Space"] = cmp.mapping.complete(),

					-- close completion window
					["<C-e>"] = cmp.mapping.abort(),

					-- confirm completion, only when you explicitly selected an option
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),
				-- Order matters, cmp will provide lsp suggestions above all else
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})

			-- Autocomplete in search mode
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Autocomplete in cmdline
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{
						name = "cmdline",
						option = {
							ignore_cmds = { "Man", "!" },
						},
					},
				}),
			})
		end,
	},
}
