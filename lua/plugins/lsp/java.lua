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
    end,
    setup_jdtls = function()
        local jdtls = require("jdtls")
        local home = os.getenv("HOME")
        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
        local workspace_dir = home .. "/.local/share/jdtls-workspace/" .. project_name

        -- Find the root directory of the project (e.g., where pom.xml or build.gradle is located)
        local root_markers = { "pom.xml", "build.gradle", "gradlew", "mvnw" }
        local root_dir = require("jdtls.setup").find_root(root_markers)

        if not root_dir then
            vim.notify("Could not find Java project root. Skipping jdtls setup.", vim.log.levels.WARN)
            return
        end

        -- Configuration for jdtls
        local config = {
            cmd = {
                "java", -- Path to Java executable
                "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                "-Dosgi.bundles.defaultStartLevel=4",
                "-Declipse.product=org.eclipse.jdt.ls.core.product",
                "-Dlog.protocol=true",
                "-Dlog.level=ALL",
                "-Xms1g",
                "--add-modules=ALL-SYSTEM",
                "--add-opens",
                "java.base/java.util=ALL-UNNAMED",
                "--add-opens",
                "java.base/java.lang=ALL-UNNAMED",
                "-jar",
                vim.fn.glob(
                    home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
                ),
                "-configuration",
                home .. "/.local/share/nvim/mason/packages/jdtls/config_linux", -- Adjust based on OS (e.g., config_mac, config_win)
                "-data",
                workspace_dir,
            },
            root_dir = root_dir,
            settings = {
                java = {
                    eclipse = {
                        downloadSources = true,
                    },
                    configuration = {
                        updateBuildConfiguration = "interactive",
                    },
                    maven = {
                        downloadSources = true,
                    },
                    implementationsCodeLens = {
                        enabled = true,
                    },
                    referencesCodeLens = {
                        enabled = true,
                    },
                    springBoot = {
                        ls = {
                            enabled = true, -- Enable Spring Boot support
                        },
                    },
                },
            },
            init_options = {
                bundles = {},
            },
        }

        -- Start jdtls
        jdtls.start_or_attach(config)

        -- Keybindings
        local opts = { noremap = true, silent = true }
        vim.api.nvim_buf_set_keymap(0, "n", "<leader>co", "<cmd>lua require('jdtls').organize_imports()<CR>", opts)
        vim.api.nvim_buf_set_keymap(0, "n", "<leader>cv", "<cmd>lua require('jdtls').extract_variable()<CR>", opts)
        vim.api.nvim_buf_set_keymap(
            0,
            "v",
            "<leader>cm",
            "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
            opts
        )
    end,
}
