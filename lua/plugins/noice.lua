return {
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
      },
      messages = {
        enabled = true, -- Habilitar los mensajes en la barra inferior
        view = "mini", -- Modo compacto
      },
      lsp = {
        message = { enabled = false }, -- 🔥 Deshabilitar mensajes del LSP en Noice
        signature = {
          enabled = true,
        },
        hover = {
          enabled = true,
        },
      },
    },
  },
}
