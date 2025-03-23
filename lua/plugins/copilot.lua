return {
  -- Plugin base de Copilot (NECESARIO)
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = { "InsertEnter", "LspAttach" },
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
      filetypes = { ["*"] = true },
      panel = { enabled = false }, -- Desactiva el panel flotante de Copilot
    },
    copilot_model = "gpt-4o-copilot",
    config = function(_, opts)
      require("copilot").setup(opts)
    end,
  },
}
