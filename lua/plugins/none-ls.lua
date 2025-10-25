return {
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{
				"<leader>t",
				function()
					local function null_ls_formats_available()
						local ok, sources = pcall(require, "null-ls.sources")
						if not ok then
							return false
						end
						local ft = vim.bo.filetype
						local avail = sources.get_available(ft, "NULL_LS_FORMATTING")
						return #avail > 0
					end

					local use_null = null_ls_formats_available()

					vim.lsp.buf.format({
						async = true,
						filter = function(client)
							if use_null then
								return client.name == "null-ls"
							end
							return client.name ~= "null-ls"
								and (client.supports_method and client.supports_method("textDocument/formatting"))
						end,
					})
				end,
				desc = "Format (null-ls preferred when available)",
			},
		},
		opts = function()
			local null_ls = require("null-ls")

			local function module_path()
				local gomod = vim.fs.find("go.mod", { upward = true, type = "file" })[1]
				if not gomod then
					return nil
				end
				for line in io.lines(gomod) do
					local m = line:match("^module%s+(.+)$")
					if m then
						return m
					end
				end
			end
			local mod = module_path()
			local goimports_args = { "-srcdir", "$DIRNAME" }
			if mod then
				table.insert(goimports_args, "-local")
				table.insert(goimports_args, mod)
			end

			local sources = {
				null_ls.builtins.formatting.goimports.with({ args = goimports_args }),
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.terraform_fmt,
			}

			local tflint = null_ls.builtins.diagnostics.tflint
			if tflint then
				table.insert(sources, tflint)
			end

			return { sources = sources }
		end,
	},

	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"goimports",
				"gofumpt",
			},
			automatic_installation = true,
		},
	},
}
