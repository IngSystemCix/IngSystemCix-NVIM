return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 5,
      open_mapping = [[<C-t>]],
      hide_numbers = true,
      shading_factor = 2,
      start_in_insert = true,
      persist_size = true,
      close_on_exit = true,
      shell = "powershell.exe",
      direction = "float", -- Todas serán flotantes
      float_opts = {
        border = "rounded",
        winblend = 10,
        width = 80,
        height = 20,
        zindex = 50,
        title = " IngSystemCix Terminal ",  -- Texto que aparecerá en la parte superior
        title_pos = "center",
      },
      highlights = {
        NormalFloat = { guibg = "#181926" }, -- Fondo de la terminal flotante
        FloatBorder = { guifg = "#4fd6be", guibg = "#181926" }, -- Borde de la terminal
      },
      shade_terminals = true, -- Asegura que los colores personalizados se apliquen a la terminal flotantes
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      local Terminal = require("toggleterm.terminal").Terminal
      local terminals = {}

      -- Función para alternar terminales flotantes
      _G.toggle_term = function(count)
        if not terminals[count] then
          terminals[count] = Terminal:new({
            count = count,
            direction = "float",
            hidden = true,
          })
        end
        terminals[count]:toggle()
      end

      -- Atajos de teclado con descripción
      vim.keymap.set("n", "<leader>1", function() _G.toggle_term(1) end, { noremap = true, silent = true, desc = "Abrir terminal flotante 1" })
      vim.keymap.set("n", "<leader>2", function() _G.toggle_term(2) end, { noremap = true, silent = true, desc = "Abrir terminal flotante 2" })
      vim.keymap.set("n", "<leader>3", function() _G.toggle_term(3) end, { noremap = true, silent = true, desc = "Abrir terminal flotante 3" })
    end,
  },
}
