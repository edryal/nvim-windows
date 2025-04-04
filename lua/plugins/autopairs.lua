return {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    dependencies = {
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require'nvim-autopairs'.setup({
            check_ts = true,
            ts_config = {
                lua = { "string" },
                javascript = { "template_string" },
                java = false,
            }
        })

        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")

        -- Whenever we accept a choice from an autocompletion, make sure that any pairs are automatically closed
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
}
