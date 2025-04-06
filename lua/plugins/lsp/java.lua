return {
    "mfussenegger/nvim-jdtls", -- Plugin for Java development with jdtls
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        local lspconfig = require("lspconfig")

        lspconfig.jdtls.setup({
            cmd = { "jdtls" }, -- Ensure jdtls is installed via Mason
            root_dir = require("lspconfig.util").root_pattern("pom.xml", "build.gradle", ".git"),
        })
        require("plugins.lsp.config.jdtls")
    end,
}
