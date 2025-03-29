-- lua/plugins/lsp/java.lua

local lspconfig = require("lspconfig")

lspconfig.jdtls.setup({
    cmd = { "jdtls" }, -- Ensure jdtls is installed via Mason
    root_dir = require("lspconfig.util").root_pattern("pom.xml", "build.gradle", ".git"),
})

return {}
