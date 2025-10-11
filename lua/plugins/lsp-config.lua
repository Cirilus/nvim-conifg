return {
    "neovim/nvim-lspconfig",
    keys = {
        { "<leader>a", function() vim.diagnostic.open_float() end, desc = "Show diagnostics (float)" },
        { "<leader>ф", function() vim.diagnostic.open_float() end, desc = "Show diagnostics (float)" },
        { "[d", function() vim.diagnostic.goto_prev() end, desc = "Prev diagnostic" },
        { "]d", function() vim.diagnostic.goto_next() end, desc = "Next diagnostic" },
    },
    config = function()
        -- Terraform LSP
        local terraform_root_markers = {
            ".terraform",  -- appears after terraform init
            "terragrunt.hcl",
            "main.tf",
            "versions.tf",
            ".git",
        }

        vim.lsp.config("terraformls", {
            cmd = { "terraform-ls", "serve" },   -- ensure this binary exists (Mason can install it)
            filetypes = { "terraform", "terraform-vars" }, -- no plain "hcl"
            root_markers = terraform_root_markers,
            -- Use init_options if you need LS knobs; settings{} is ignored by terraform-ls
            init_options = {
                -- example:
                experimentalFeatures = {
                    validateOnSave = false, -- leave validation to tflint/null-ls if you prefer
                },
            },
        })

        vim.lsp.enable("terraformls")

        -- Format on save for Terraform/HCL using null-ls when available
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = { "*.tf", "*.tfvars", "*.hcl" },
            callback = function()
                local function null_ls_formats_available()
                    local ok, sources = pcall(require, "null-ls.sources")
                    if not ok then return false end
                    local ft = vim.bo.filetype
                    local avail = sources.get_available(ft, "NULL_LS_FORMATTING")
                    return #avail > 0
                end

                local use_null = null_ls_formats_available()

                vim.lsp.buf.format({
                    async = false,
                    filter = function(client)
                        if use_null then
                            return client.name == "null-ls"
                        end
                        return client.name ~= "null-ls"
                            and (client.supports_method and client.supports_method("textDocument/formatting"))
                    end,
                })
            end,
        })
    end,
}
