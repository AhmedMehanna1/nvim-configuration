return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    -- ts-autotag utilizes treesitter to understand the code structure to automatically close tsx tags
    "windwp/nvim-ts-autotag",
  },
  -- when the plugin builds run the TSUpdate command to ensure all our servers are installed and updated
  build = ":TSUpdate",
  config = function()
    -- gain access to the treesitter config functions
    local ts_config = require("nvim-treesitter.configs")

    -- call the treesitter setup function with properties to configure our experience
    ts_config.setup({
      -- make sure we have vim, vimdoc, lua, java, javascript, typescript, html, css, json, tsx, markdown, markdown, inline markdown and gitignore highlighting servers
      ensure_installed = {
        "vim",
        "vimdoc",
        "lua",
        "java",
        "javascript",
        "typescript",
        "html",
        "css",
        "json",
        "tsx",
        "markdown",
        "markdown_inline",
        "gitignore",
      },
      -- make sure highlighting it anabled
      highlight = { enable = true },
      -- enable tsx auto closing tag creation
      autotag = {
        enable = true,
      },
    })
  end,
}

-- return {
--   "nvim-treesitter/nvim-treesitter",
--   event = { "BufReadPre", "BufNewFile" },
--   build = ":TSUpdate",
--   dependencies = {
--     "windwp/nvim-ts-autotag",
--   },
--   config = function()
--     -- import nvim-treesitter plugin
--     local treesitter = require("nvim-treesitter.configs")
--
--     -- configure treesitter
--     treesitter.setup({ -- enable syntax highlighting
--       highlight = {
--         enable = true,
--         additional_vim_regex_highlighting = false,
--       },
--       -- enable indentation
--       indent = { enable = true },
--       -- enable autotagging (w/ nvim-ts-autotag plugin)
--       autotag = {
--         enable = true,
--       },
--       -- ensure these language parsers are installed
--       ensure_installed = {
--         "rust",
--         "ron",
--         "json",
--         "javascript",
--         "typescript",
--         "tsx",
--         "yaml",
--         "html",
--         "css",
--         "prisma",
--         "markdown",
--         "markdown_inline",
--         "svelte",
--         "graphql",
--         "bash",
--         "lua",
--         "vim",
--         "dockerfile",
--         "gitignore",
--         "query",
--         "vimdoc",
--         "c",
--         "toml",
--       },
--       auto_install = true,
--       ident = { enable = true },
--       rainbow = {
--         enable = true,
--         extended_mode = true,
--         max_file_lines = nil,
--       },
--       incremental_selection = {
--         enable = true,
--         keymaps = {
--           init_selection = "<C-space>",
--           node_incremental = "<C-space>",
--           scope_incremental = false,
--           node_decremental = "<bs>",
--         },
--       },
--     })
--   end,
-- }
