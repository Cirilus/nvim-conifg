return {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  opts  = {
    bind                = true,
    hint_enable         = true,
    floating_window     = true,
    handler_opts        = { border = "rounded" },

    toggle_key          = "<C-s>",
    select_signature_key = "<M-n>",
  },
  config = function(_, opts)
    local sig = require("lsp_signature")
    sig.setup(opts)

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev) sig.on_attach(opts, ev.buf) end,
    })

    vim.keymap.set({ "n", "i" }, "<C-s>", function()
      sig.toggle_float_win()
    end, { desc = "Toggle signature help" })
  end,
}
