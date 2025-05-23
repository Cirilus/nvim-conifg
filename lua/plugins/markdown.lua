return {
  -- pick ONE of these ↓
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install", -- or: "npm install" if you prefer
    ft = { "markdown" },
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
    },
  },
}

