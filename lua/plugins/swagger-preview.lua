return {
    "vinnymeller/swagger-preview.nvim",
    cmd = { "SwaggerPreview", "SwaggerPreviewStop", "SwaggerPreviewToggle" },
    build = "npm i",
    config = function()
        require("swagger-preview").setup({
            port = 8000,
            host = "localhost"
        })
    end,
}
