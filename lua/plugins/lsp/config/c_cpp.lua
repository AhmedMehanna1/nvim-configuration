-- lua/plugins/lsp/c_cpp.lua

local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
})
