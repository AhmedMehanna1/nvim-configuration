return {
    "williamboman/mason.nvim", -- Mason for managing LSP servers and tools
    dependencies = {
        "williamboman/mason-lspconfig.nvim", -- Bridge between Mason and LSP-Config
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { -- Ensure these servers are installed automatically
                "rust_analyzer",
                "gopls",
                "clangd",
                "jdtls",
                "pyright",
                "jsonls",
                "yamlls",
                "lemminx",
            },
        })
        require("mason-tool-installer").setup({
            "stylua", -- lua formatter
            "lua-language-server",
            "typescript-language-server",
            "bash-language-server",
            "shellcheck",
        })
    end,
}
