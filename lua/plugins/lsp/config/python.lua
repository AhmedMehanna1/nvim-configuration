-- lua/plugins/lsp/python.lua

local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
})
