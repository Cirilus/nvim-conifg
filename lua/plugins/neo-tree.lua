return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",               -- use the latest major
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- icons
    "MunifTanjim/nui.nvim",
  },
  
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo‑tree" },
    { "<leader>у", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo‑tree" },
    { "<leader>r", "<cmd>Neotree focus<cr>",  desc = "Focus Neo‑tree" },
    { "<leader>к", "<cmd>Neotree focus<cr>",  desc = "Focus Neo‑tree" },
  },

  opts = {
    -- What Neo‑tree shows
    filesystem = {
      filtered_items = {
        visible         = false,  -- don’t show filtered items by default
        hide_dotfiles    = false,
        hide_gitignored  = false,
      },
    },

    -- Window look & feel
    window = {
      width = 30,            -- sidebar width
      mappings = {
        ["<space>"] = "none", -- free up <Space> inside the tree
      },
    },
  },
}

