return {
  "neovim/nvim-lspconfig",
  keys = {
    { "<leader>a", function() vim.diagnostic.open_float() end, desc = "Show diagnostics (float)" },
    { "<leader>ф", function() vim.diagnostic.open_float() end, desc = "Show diagnostics (float)" },
    { "[d", function() vim.diagnostic.goto_prev() end, desc = "Prev diagnostic" },
    { "]d", function() vim.diagnostic.goto_next() end, desc = "Next diagnostic" },
  },
}
