return {
    {
        "tpope/vim-fugitive",
        cmd = { "Git", "Gdiffsplit", "Gblame", "GBrowse" },
        keys = {
            { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
        },
    },

    -- Gutter signs + hunk actions
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("gitsigns").setup({
                current_line_blame = true, 
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = "eol",
                    delay = 500,
                    ignore_whitespace = false,
                },
                current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
            })
        end,
        keys = {
            { "]c",         function() require("gitsigns").next_hunk() end,                 desc = "Next git hunk" },
            { "[c",         function() require("gitsigns").prev_hunk() end,                 desc = "Prev git hunk" },
            { "<leader>hs", function() require("gitsigns").stage_hunk() end,                desc = "Stage hunk" },
            { "<leader>hr", function() require("gitsigns").reset_hunk() end,                desc = "Reset hunk" },
            { "<leader>hp", function() require("gitsigns").preview_hunk() end,              desc = "Preview hunk" },
            -- toggle blame inline
            { "<leader>hb", function() require("gitsigns").toggle_current_line_blame() end, desc = "Toggle git blame" },
        },
    },

    -- Diff viewer
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewClose" },
        keys = {
            { "<leader>do", "<cmd>DiffviewOpen<cr>",  desc = "Open diffview" },
            { "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "Close diffview" },
        },
    }
}
