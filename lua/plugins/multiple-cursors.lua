return {
  {
    'terryma/vim-multiple-cursors',
    config = function()
      -- Configuración de vim-multiple-cursors
      vim.g.MultipleCursorsStartKey = '<C-n>'  -- Seleccionar palabras como Ctrl-N
      vim.g.MultipleCursorsNextKey = 'n'      -- Siguiente ocurrencia con 'n'
      vim.g.MultipleCursorsPrevKey = 'N'      -- Anterior ocurrencia con 'N'
      vim.g.MultipleCursorsSkipKey = 'q'      -- Saltar la ocurrencia actual con 'q'
      vim.g.MultipleCursorsQuitKey = 'Q'      -- Eliminar el cursor actual con 'Q'

      -- Configuración para las teclas de dirección
      vim.g.MultipleCursorsUpKey = '<C-Up>'    -- Crear cursores verticalmente hacia arriba
      vim.g.MultipleCursorsDownKey = '<C-Down>' -- Crear cursores verticalmente hacia abajo

      -- Configuración para selección de caracteres
      vim.g.MultipleCursorsCharSelectKey = '<S-Left>'  -- Seleccionar un carácter a la vez a la izquierda
      vim.g.MultipleCursorsCharSelectKey = '<S-Right>' -- Seleccionar un carácter a la vez a la derecha
    end,
  }
}
