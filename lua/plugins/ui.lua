return {
  { -- Corrección en la estructura de "nvim-docs-view"
    "amrbashir/nvim-docs-view",
    lazy = true, -- Carga diferida
    cmd = "DocsViewToggle", -- Comando para activar la vista de documentación
    opts = {
      position = "right", -- Ubicación a la derecha
      width = 60, -- Ancho del panel de documentación
    },
  },
}
