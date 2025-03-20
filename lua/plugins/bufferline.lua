return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        separator_style = "slant", -- Estilo de separación (puede ser "slant", "thick", "thin")
        offsets = {
          { filetype = "NvimTree", text = "Explorer", highlight = "Directory", text_align = "center" },
        },
        diagnostics = "nvim_lsp",
        show_tab_indicators = true, -- Muestra los indicadores de pestañas
        show_duplicate_prefix = true, -- Muestra el prefijo de duplicados
        hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
        },
      },
    },
  },
}
