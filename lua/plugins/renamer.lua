return {
  "filipdutescu/renamer.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>fr", ":lua require('renamer').rename()<CR>", desc = "LSP Rename (UI)" },
  },
  config = function()
    require("renamer").setup({
      prompt_prefix = "➤ ",
    })
  end,
}
