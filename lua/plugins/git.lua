return {

  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git", "Gstatus", "Gdiffsplit", "Gread", "Gwrite" }, 
    keys = {
      { "<leader>gs", ":G<CR>",        desc = "Git status (Fugitive)" },
      { "<leader>gd", ":Gdiffsplit<CR>", desc = "Diff against HEAD"   },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" }, 
    opts = {
      signs = {
        add          = { text = "▎" },
        change       = { text = "▎" },
        delete       = { text = "契" },
        topdelete    = { text = "契" },
        changedelete = { text = "◆" },
      },
      current_line_blame = true,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map("n", "]c", gs.next_hunk,  "Next hunk")
        map("n", "[c", gs.prev_hunk,  "Prev hunk")

        map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>",   "Stage hunk")
        map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>",   "Reset hunk")
        map("n", "<leader>hS", gs.stage_buffer,                       "Stage buffer")
        map("n", "<leader>hu", gs.undo_stage_hunk,                    "Undo stage")
        map("n", "<leader>hR", gs.reset_buffer,                       "Reset buffer")
        map("n", "<leader>hp", gs.preview_hunk_inline,                "Preview hunk")
        map("n", "<leader>hb", gs.toggle_current_line_blame,          "Toggle blame")
      end,
    },
  },
}
