return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x", -- use the latest major
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },

    cmd = "Neotree",
    keys = {
        { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo‑tree" },
        { "<leader>у", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo‑tree" },
        {
            "<leader>r",
            function()
                -- if current buffer is Neo-tree, go back to previous window
                if vim.bo.filetype == "neo-tree" then
                    vim.cmd.wincmd("p")
                else
                    vim.cmd("Neotree focus") -- otherwise focus Neo-tree
                end
            end,
            desc = "Toggle focus Neo-tree / Code"
        },
        {
            "<leader>к",
            function()
                -- if current buffer is Neo-tree, go back to previous window
                if vim.bo.filetype == "neo-tree" then
                    vim.cmd.wincmd("p")
                else
                    vim.cmd("Neotree focus") -- otherwise focus Neo-tree
                end
            end,
            desc = "Toggle focus Neo-tree / Code"
        },
    },

    opts = {
        filesystem = {
            filtered_items = {
                hide_empty_dir  = true,
                hide_dotfiles   = false,
                hide_gitignored = false,
            },
            follow_current_file = { enabled = true },
            hijack_netrw_behavior = "open_current",
            use_libuv_file_watcher = true,
        },


        -- Window look & feel
        window = {
            width = 30,               -- sidebar width
            mappings = {
                ["<space>"] = "none", -- free up <Space> inside the tree
            },
        },
    },
}
