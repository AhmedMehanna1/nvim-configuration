-- lua/plugins/lsp/rust.lua

local lspconfig = require("lspconfig")

lspconfig.rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                enable = true, -- Enable diagnostics
            },
            cargo = {
                allFeatures = true, -- Enable all features
            },
            checkOnSave = {
                command = "clippy", -- Run `cargo clippy` on save
            },
        },
    },
})

return {}
