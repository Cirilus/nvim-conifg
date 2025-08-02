return {

  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git", "Gstatus", "Gdiffsplit", "Gread", "Gwrite" }, 
    keys = {
      { "<leader>gs", ":Git<CR>",                       desc = "Git status (Fugitive)" },
      { "<leader>gc", ":Git commit<CR>",                desc = "Git commit" },
      { "<leader>gC", ":Git commit --amend<CR>",        desc = "Git amend" },
      { "<leader>gp", ":Git pull --rebase<CR>",         desc = "Git pull --rebase" },
      { "<leader>gP", ":Git push<CR>",                  desc = "Git push" },
      { "<leader>gb", ":Git blame<CR>",                 desc = "Git blame (buffer)" },
      { "<leader>gd", ":Gdiffsplit<CR>",                desc = "Diff (split)" },
      { "<leader>gD", ":Gvdiffsplit<CR>",               desc = "Diff (vsplit)" },
      { "<leader>gr", ":Gread<CR>",                     desc = "Discard buffer changes (checkout file)" },
      { "<leader>gw", ":Gwrite<CR>",                    desc = "Stage current file (git add %)" },
      -- Optional (needs tpope/vim-rhubarb for GitHub): open current line/range on remote
      { "<leader>gB", ":GBrowse<CR>",                   desc = "Open on remote (current file/line)" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add          = { text = "▎" },
        change       = { text = "▎" },
        delete       = { text = "▁" },
        topdelete    = { text = "▔" },
        changedelete = { text = "▎" },
      },

      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = "gitsigns: " .. desc })
        end

        map("n", "]h", gs.next_hunk, "Next hunk")
        map("n", "[h", gs.prev_hunk, "Prev hunk")

        map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", "Stage hunk")
        map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset hunk")
        map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
        map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
        map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")

        map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
        map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame line (full)")

        map("n", "<leader>ht", gs.toggle_current_line_blame, "Toggle line blame")
        map("n", "<leader>hd", gs.toggle_deleted, "Toggle show deleted")
        map("n", "<leader>hl", gs.setloclist, "Send all hunks to loclist")

        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select hunk")
      end,
    },
  },
}
