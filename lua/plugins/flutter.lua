-- lazy.nvim (lua/plugins/flutter.lua)
return {
  -- Flutter tools
  {
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- Opcional para mejor UI
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("flutter-tools").setup {
        ui = {
          border = "rounded",
          notification_style = "native", -- puedes cambiar a "plugin" si usas nvim-notify
        },
        decorations = {
          statusline = {
            app_version = false,
            device = false,
            project_config = false,
          }
        },
        debugger = {
          enabled = false,
          exception_breakpoints = {},
          evaluate_to_string_in_debug_views = true,
        },
        flutter_path = "C:/dev/flutter/bin/flutter.bat", -- Cambia esto a la ruta de tu SDK de Flutter
        flutter_lookup_cmd = nil,
        root_patterns = { ".git", "pubspec.yaml" },
        fvm = false,
        default_run_args = nil,
        widget_guides = {
          enabled = false,
        },
        closing_tags = {
          highlight = "ErrorMsg",
          prefix = ">",
          priority = 10,
          enabled = true,
        },
        dev_log = {
          enabled = true,
          notify_errors = false,
          open_cmd = "belowright 15split", -- 👈 aquí se fuerza consola abajo
          focus_on_open = true,
        },
        dev_tools = {
          autostart = false,
          auto_open_browser = false,
        },
        outline = {
          open_cmd = "30vnew",
          auto_open = false,
        },
        lsp = {
          color = {
            enabled = false,
            background = false,
            foreground = false,
            virtual_text = true,
            virtual_text_str = "■",
          },
          on_attach = function(_, bufnr)
            -- Puedes agregar keybindings aquí si deseas
          end,
          capabilities = function(config)
            config.specificThingIDontWant = false
            return config
          end,
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            renameFilesWithClasses = "prompt",
            enableSnippets = true,
            updateImportsOnRename = true,
          }
        }
      }
    end,
  },

  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").dartls.setup({})
    end,
  },

  -- Formateo
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.dart_format,
        },
      })
    end,
  },
}
