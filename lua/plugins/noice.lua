return {
  -- Plugins necesarios para nvim-cmp y cmdline
  {
    "hrsh7th/nvim-cmp", -- Autocompletado en general
    dependencies = {
      "hrsh7th/cmp-buffer",   -- Fuente de buffer
      "hrsh7th/cmp-path",     -- Fuente de rutas
      "hrsh7th/cmp-cmdline",  -- Fuente para cmdline
      "L3MON4D3/LuaSnip",     -- Snippets
    },
    config = function()
      local cmp = require('cmp')

      -- Configuración de cmdline
      cmp.setup.cmdline(':', {
        sources = {
          { name = 'cmdline' },
          { name = 'path' },
        },
      })

      cmp.setup.cmdline('/', {
        sources = {
          { name = 'buffer' },
        },
      })

      cmp.setup.cmdline('?', {
        sources = {
          { name = 'buffer' },
        },
      })
    end,
  },
  {
    "folke/noice.nvim",
    opts = {
      -- Configuración de las vistas
      cmdline = {
        enabled = true, -- habilitar la interfaz de cmdline personalizada
        view = "cmdline_popup", -- establecer la vista como cmdline_popup
        opts = {},
        format = {
          cmdline = { pattern = "^:", icon = "", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
          filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
          lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
          help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
          input = { view = "cmdline_input", icon = "󰥻 " }, -- Usado por input()
        },
      },
      messages = {
        enabled = true, -- habilitar la interfaz de mensajes personalizada
        view = "notify", -- vista por defecto para los mensajes
        view_error = "notify", -- vista para los errores
        view_warn = "notify", -- vista para las advertencias
        view_history = "messages", -- vista para :messages
        view_search = "virtualtext", -- vista para los mensajes de búsqueda
      },
      popupmenu = {
        enabled = true, -- habilitar la interfaz emergente de completado de cmdline
        backend = "nui", -- backend para mostrar las completaciones del cmdline
        kind_icons = {}, -- si quieres íconos, añádelos aquí
      },
      notify = {
        enabled = true, -- usar Noice como `vim.notify`
        view = "notify", -- vista para las notificaciones
      },
      lsp = {
        progress = {
          enabled = true,
          format = "lsp_progress",
          format_done = "lsp_progress_done",
          throttle = 1000 / 30, -- frecuencia de actualización del progreso del LSP
          view = "mini",
        },
        signature = {
          enabled = true,
          auto_open = {
            enabled = true,
            trigger = true, -- Mostrar automáticamente la ayuda de firma al escribir un carácter desencadenante
            throttle = 50, -- debounce en milisegundos
          },
        },
        hover = {
          enabled = true,
        },
        message = {
          enabled = true,
          view = "notify",
        },
      },
      health = {
        checker = true, -- habilitar comprobaciones de salud
      },
      presets = {
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true, -- agregar borde a la documentación del LSP y ayuda de firmas
      },
      throttle = 1000 / 30, -- frecuencia de comprobación de actualizaciones
    },
  },
}
