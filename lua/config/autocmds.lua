vim.api.nvim_create_autocmd({
    "BufEnter",
    "BufWinEnter",
}, {
    pattern = { "*.md", "*.json", "*.mdx", "*.agx", "*.svg" },
    callback = function()
        vim.cmd("set concealleavel=0")
    end,
})

vim.api.nvim_create_autocmd({
    "BufLeave",
    "BufWinLeave",
}, {
    pattern = { "*.md", "*.json", "*.mdx", "*.agx", "*.svg" },
    callback = function()
        vim.cmd("set concealleavel=3")
    end,
})

-- Disable nvim-cmp for Markdown files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        local cmp = require("cmp")

        -- manual complete
        cmp.setup({
            completion = {
                autocomplete = false,
                completeopt = "menu,menuone,noinsert",
            },
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping.complete(),
            }),
        })
    end,
})

vim.api.nvim_create_augroup("AutoLintAndFormat", { clear = true })

-- Rust
vim.api.nvim_create_autocmd("BufWritePost", {
    group = "AutoLintAndFormat",
    pattern = "*.rs",
    command = "!cargo fmt && cargo clippy",
})

-- Go
vim.api.nvim_create_autocmd("BufWritePost", {
    group = "AutoLintAndFormat",
    pattern = "*.go",
    command = "!gofmt -w % && golangci-lint run",
})

-- C/C++
vim.api.nvim_create_autocmd("BufWritePost", {
    group = "AutoLintAndFormat",
    pattern = { "*.c", "*.cpp", "*.h", "*.hpp" },
    command = "!clang-format -i % && cppcheck %",
})

-- Java
vim.api.nvim_create_autocmd("BufWritePost", {
    group = "AutoLintAndFormat",
    pattern = "*.java",
    command = "!google-java-format -i % && checkstyle %",
})

-- Python
vim.api.nvim_create_autocmd("BufWritePost", {
    group = "AutoLintAndFormat",
    pattern = "*.py",
    command = "!black % && isort % && flake8 %",
})

-- JavaScript/TypeScript
vim.api.nvim_create_autocmd("BufWritePost", {
    group = "AutoLintAndFormat",
    pattern = { "*.js", "*.ts", "*.jsx", "*.tsx" },
    command = "!prettier --write % && eslint_d %",
})
