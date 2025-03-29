return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- Rust
                null_ls.builtins.formatting.rustfmt,

                -- Go
                null_ls.builtins.formatting.goimports,
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.diagnostics.golangci_lint,

                -- C/C++
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.diagnostics.cppcheck,

                -- Java
                null_ls.builtins.formatting.google_java_format,
                null_ls.builtins.diagnostics.checkstyle,

                -- Python
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.diagnostics.flake8,

                -- JSON
                null_ls.builtins.formatting.fixjson,

                -- YAML
                null_ls.builtins.formatting.yamlfmt,

                -- XML
                null_ls.builtins.formatting.xmlformat,

                -- JavaScript/TypeScript
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.diagnostics.eslint_d,
            },
            on_attach = function(client)
                -- Autoformat on save
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        callback = function()
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,
        })
    end,
}
