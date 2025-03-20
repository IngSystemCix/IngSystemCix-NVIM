return {
  "zbirenbaum/copilot-cmp",
  event = { "InsertEnter", "LspAttach" },
  fix_pairs = true,
  cmd = "Copilot",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true, -- Muestra sugerencias automáticamente
      debounce = 75,
      keymap = {
        accept = "<C-J>", -- Aceptar sugerencia con Ctrl+J
        accept_word = false,
        accept_line = false,
        next = "<C-]>",
        prev = "<C-[>",
        dismiss = "<C-\\>",
      },
    },
    panel = { enabled = false }, -- Desactiva el panel flotante de Copilot
  },
  config = function(_, opts)
    require("copilot").setup(opts)
  end,
}
