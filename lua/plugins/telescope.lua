return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope", -- Lazy load Telescope when the command is called
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true }, -- Plenary is required for Telescope
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Optional FZF extension
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").cycle_history_next,
            ["<C-k>"] = require("telescope.actions").cycle_history_prev,
          },
        },
      },
    })
    pcall(telescope.load_extension, "fzf") -- Load FZF extension if installed
  end,
}

