return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>",           desc = "Find Files" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>",            desc = "Live Grep" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>",              desc = "Buffers" },

        -- LSP-related Telescope pickers
        { "gd",         "<cmd>Telescope lsp_definitions<cr>",      desc = "Go to definition" },
        { "gr",         "<cmd>Telescope lsp_references<cr>",       desc = "Go to references" },
        { "gi",         "<cmd>Telescope lsp_implementations<cr>",  desc = "Go to implementation" },
        { "gt",         "<cmd>Telescope lsp_type_definitions<cr>", desc = "Go to type definition" },

        -- Git base 
        { "<leader>gc", "<cmd>Telescope git_commits<cr>",          desc = "Git commits" },
        { "<leader>gs", "<cmd>Telescope git_status<cr>",           desc = "Git status" },
        { "<leader>gb", "<cmd>Telescope git_branches<cr>",         desc = "Git branches" },
    },
}
