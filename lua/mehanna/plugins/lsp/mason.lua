return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          -- package_installed = "✓",
          -- package_pending = "➜",
          -- package_uninstalled = "✗",
          package_installed = "",
          package_pending = "",
          package_uninstalled = "",
        },
      },
    })

    mason_lspconfig.setup({
      automatic_installation = { "rust_analyzer" },
      -- list of servers for mason to install
      ensure_installed = {
        "angularls",
        "bashls",
        "clangd",
        "dockerls",
        "jdtls",
        "jsonls",
        "lua_ls",
        "nginx_language_server",
        "pylsp",
        "rust_analyzer",
        "sqlls",
        "lemminx",
        "yamlls",
        "svelte",
        "graphql",
        "emmet_ls",
        "taplo",
        -- "java-language-server",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint",
        "eslint_d",
        "rustfmt",
        "google-java-format",
        "xmlformatter",
        "codelldb",
        "cpptools",
        "lua-language-server",
      },
    })

    local keymap = vim.keymap
    keymap.set("n", "<leader>mh", "<cmd>Mason<cr>", { desc = "Open Mason home" })
  end,
}
