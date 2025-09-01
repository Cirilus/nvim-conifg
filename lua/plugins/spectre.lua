return {
  "nvim-pack/nvim-spectre",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
  },
  keys = {
    {
      "<leader>sr",
      function()
        require("spectre").open()
      end,
      desc = "Spectre: Search & Replace",
    },
    {
      "<leader>sw",
      function()
        require("spectre").open_visual({ select_word = true })
      end,
      desc = "Spectre: Search word",
    },
    {
      "<leader>sf",
      function()
        require("spectre").open_file_search({ select_word = true })
      end,
      desc = "Spectre: Search in current file",
    },
  },
  opts = {
    live_update = true, -- auto update when typing
    mapping = {
      ["toggle_line"] = {
        map = "dd",
        cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
        desc = "toggle current item",
      },
      ["enter_file"] = {
        map = "<CR>",
        cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
        desc = "open file",
      },
    },
  },
}
