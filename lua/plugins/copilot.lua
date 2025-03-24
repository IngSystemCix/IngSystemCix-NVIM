return {
  -- Plugin base de Copilot (NECESARIO)
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = { "BufReadPost", "InsertEnter", "LspAttach" },
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true, -- Muestra sugerencias automáticamente
        debounce = 75,
        keymap = {
          accept = false,
          accept_word = false,
          accept_line = false,
          next = "<C-]>",
          prev = "<C-[>",
          dismiss = "<C-\\>",
        },
      },
      filetypes = { ["*"] = true },
      copilot_node_command = vim.fn.executable("node") == 1 and "node" or nil,
      panel = { enabled = false }, -- Desactiva el panel flotante de Copilot
    },
    copilot_model = "gpt-4o-copilot",
    config = function(_, opts)
      require("copilot").setup(opts)
    end,
  },
}
