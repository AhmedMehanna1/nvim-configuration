-- vim.opt.updatetime = 1000
--
-- vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "CursorHold", "CursorHoldI" }, {
--   pattern = "*",
--   command = "silent! wall",
-- })

-- vim.api.nvim_create_autocmd("TextChanged", {
--   pattern = "*",
--   callback = function()
--     if vim.api.nvim_get_mode().mode ~= "i" then
--       vim.cmd("silent! wall")
--     end
--   end,
-- })

-- vim.api.nvim_create_autocmd({
--   "InsertLeave",
--   "TextChanged",
-- }, {
--   pattern = { "*" },
--   command = "silent! wall",
--   nested = true,
-- })

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
