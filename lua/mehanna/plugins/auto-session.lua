return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_supress_dirs = { "~/", "~/Downloads", "~/git" },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>wf", "<cmd>SessionRestore<cr>", { desc = "Restore session for cwd" })
    keymap.set("n", "<leader>ws", "<cmd>SeessionSave<cr>", { desc = "Save session for auto session root dir" })
  end,
}
