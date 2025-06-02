return {
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")
      vim.notify = notify -- Sobrescribir notificaciones de LazyVim

      notify.setup({
        background_colour = "#191919",
        timeout = 3000,
        stages = "fade_in_slide_out",
        icons = {
          ERROR = "",
          WARN = "",
          INFO = "",
          DEBUG = "",
          TRACE = "✎",
        },
      })
      vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = "#FF0000" }) -- Rojo intenso para errores
      vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = "#FFA500" })  -- Naranja para warnings
      vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = "#00FF00" })  -- Verde para info
      vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = "#AAAAAA" }) -- Gris para debug
      vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = "#9400D3" }) -- Violeta para trace

      vim.api.nvim_set_hl(0, "NotifyERRORIcon", { fg = "#FF0000" })
      vim.api.nvim_set_hl(0, "NotifyWARNIcon", { fg = "#FFA500" })
      vim.api.nvim_set_hl(0, "NotifyINFOIcon", { fg = "#00FF00" })
      vim.api.nvim_set_hl(0, "NotifyDEBUGIcon", { fg = "#AAAAAA" })
      vim.api.nvim_set_hl(0, "NotifyTRACEIcon", { fg = "#9400D3" })

      vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = "#FF0000", bold = true })
      vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = "#FFA500", bold = true })
      vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = "#00FF00", bold = true })
      vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { fg = "#AAAAAA", bold = true })
      vim.api.nvim_set_hl(0, "NotifyTRACETitle", { fg = "#9400D3", bold = true })

      vim.api.nvim_set_hl(0, "NotifyINFOBody", { fg = "#FFFFFF" }) -- Blanco para el texto
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    opts = function()
      ---@class PluginLspOpts
      local ret = {
        diagnostics = {
          underline = true,
          update_in_insert = false,
          virtual_text = {
            spacing = 2,
            source = "if_many",
            prefix = "●",
          },
          severity_sort = true,
          signs = {
            text = {
              [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
              [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
              [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
              [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
            },
          },
        },
        inlay_hints = {
          enabled = true,
          exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
        },
        codelens = {
          enabled = false,
        },
        -- add any global capabilities here
        capabilities = {
          workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
          },
        },
        -- options for vim.lsp.buf.format
        -- bufnr and filter is handled by the LazyVim formatter,
        -- but can be also overridden when specified
        format = {
          formatting_options = nil,
          timeout_ms = nil,
        },
        -- LSP Server Settings
        servers = {
          lua_ls = {
            settings = {
              Lua = {
                workspace = {
                  checkThirdParty = false,
                },
                codeLens = {
                  enable = true,
                },
                completion = {
                  callSnippet = "Replace",
                },
                doc = {
                  privateName = { "^_" },
                },
                hint = {
                  enable = true,
                  setType = false,
                  paramType = true,
                  paramName = "Disable",
                  semicolon = "Disable",
                  arrayIndex = "Disable",
                },
              },
            },
          },
          --angularls = {
            --cmd = { "ngserver", "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", "" },
            --filetypes = { "typescript", "html", "typescriptreact", "angular" },
            --root_dir = require("lspconfig.util").root_pattern("angular.json", "project.json"),
          --},
		  angularls = {
			cmd = { "pwsh", "-File", "C:/nvm4w/nodejs/ngserver.ps1", "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", "" },
			filetypes = { "typescript", "html", "typescriptreact", "angular" },
			root_dir = require("lspconfig.util").root_pattern("angular.json", "project.json"),
		  },
          tsserver = {
            settings = {
              typescript = {
                format = {
                  enable = true,
                },
              },
              javascript = {
                format = {
                  enable = true,
                },
              },
            },
            keys = {
              { "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", desc = "Organize Imports" },
              { "<leader>cR", "<cmd>TypescriptRenameFile<CR>",      desc = "Rename File" },
            },
          },
          tailwindcss = {
            filetypes_exclude = { "markdown" },
            filetypes_include = {},
          },
          gopls = {
            gofumpt = true,
            codelenses = {
              gc_details = false,
              generate = true,
              regenerate_cgo = true,
              run_govulncheck = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            analyses = {
              nilness = true,
              unusedparams = true,
              unusedwrite = true,
              useany = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            semanticTokens = true,
          },
        },

        setup = {
          gopls = function(_, opts)
            -- workaround for gopls not supporting semanticTokensProvider
            -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
            LazyVim.lsp.on_attach(function(client, _)
              if not client.server_capabilities.semanticTokensProvider then
                local semantic = client.config.capabilities.textDocument.semanticTokens
                client.server_capabilities.semanticTokensProvider = {
                  full = true,
                  legend = {
                    tokenTypes = semantic.tokenTypes,
                    tokenModifiers = semantic.tokenModifiers,
                  },
                  range = true,
                }
              end
            end, "gopls")
            -- end workaround
          end,

          clangd = function(_, opts)
            opts.capabilities.offsetEncoding = { "utf-16" }
          end,
          angularls = function()
            LazyVim.lsp.on_attach(function(client)
              --HACK: disable angular renaming capability due to duplicate rename popping up
              client.server_capabilities.renameProvider = false
            end, "angularls")
          end,
          tailwindcss = function(_, opts)
            local tw = LazyVim.lsp.get_raw_config("tailwindcss")
            opts.filetypes = opts.filetypes or {}

            -- Add default filetypes
            vim.list_extend(opts.filetypes, tw.default_config.filetypes)

            -- Remove excluded filetypes
            --- @param ft string
            opts.filetypes = vim.tbl_filter(function(ft)
              return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
            end, opts.filetypes)

            -- Additional settings for Phoenix projects
            opts.settings = {
              tailwindCSS = {
                includeLanguages = {
                  elixir = "html-eex",
                  eelixir = "html-eex",
                  heex = "html-eex",
                },
              },
            }

            -- Add additional filetypes
            vim.list_extend(opts.filetypes, opts.filetypes_include or {})
          end,
        },
      }
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = {
        "<leader>cr",
        function()
          local inc_rename = require("inc_rename")
          return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
        end,
        expr = true,
        desc = "Rename (inc-rename.nvim)",
        has = "rename",
      }
      return ret
    end,
    ---@param opts PluginLspOpts
    config = function(_, opts)
      -- setup autoformat
      LazyVim.format.register(LazyVim.lsp.formatter())

      -- setup keymaps
      LazyVim.lsp.on_attach(function(client, buffer)
        require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
      end)

      LazyVim.lsp.setup()
      LazyVim.lsp.on_dynamic_capability(require("lazyvim.plugins.lsp.keymaps").on_attach)

      -- diagnostics signs
      if vim.fn.has("nvim-0.10.0") == 0 then
        if type(opts.diagnostics.signs) ~= "boolean" then
          for severity, icon in pairs(opts.diagnostics.signs.text) do
            local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
            name = "DiagnosticSign" .. name
            vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
          end
        end
      end

      if vim.fn.has("nvim-0.10") == 1 then
        -- inlay hints
        if opts.inlay_hints.enabled then
          LazyVim.lsp.on_supports_method("textDocument/inlayHint", function(client, buffer)
            if
                vim.api.nvim_buf_is_valid(buffer)
                and vim.bo[buffer].buftype == ""
                and not vim.tbl_contains(opts.inlay_hints.exclude, vim.bo[buffer].filetype)
            then
              vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
            end
          end)
        end

        -- code lens
        if opts.codelens.enabled and vim.lsp.codelens then
          LazyVim.lsp.on_supports_method("textDocument/codeLens", function(client, buffer)
            vim.lsp.codelens.refresh()
            vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
              buffer = buffer,
              callback = vim.lsp.codelens.refresh,
            })
          end)
        end
      end

      if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
        opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and "●"
            or function(diagnostic)
              local icons = LazyVim.config.icons.diagnostics
              for d, icon in pairs(icons) do
                if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
                  return icon
                end
              end
            end
      end

      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      local servers = opts.servers
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local has_blink, blink = pcall(require, "blink.cmp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {},
        has_blink and blink.get_lsp_capabilities() or {},
        opts.capabilities or {}
      )

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})
        if server_opts.enabled == false then
          return
        end

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end
        require("lspconfig")[server].setup(server_opts)
      end

      -- get all the servers that are available through mason-lspconfig
      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      local all_mslp_servers = {}
      if have_mason then
        -- all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
      end

      local ensure_installed = {} ---@type string[]
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          if server_opts.enabled ~= false then
            -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
            if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
              setup(server)
            else
              ensure_installed[#ensure_installed + 1] = server
            end
          end
        end
      end

      if have_mason then
        mlsp.setup({
          ensure_installed = vim.tbl_deep_extend(
            "force",
            ensure_installed,
            LazyVim.opts("mason-lspconfig.nvim").ensure_installed or {}
          ),
          handlers = { setup },
        })
      end

      if LazyVim.lsp.is_enabled("denols") and LazyVim.lsp.is_enabled("vtsls") then
        local is_deno = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
        LazyVim.lsp.disable("vtsls", is_deno)
        LazyVim.lsp.disable("denols", function(root_dir, config)
          if not is_deno(root_dir) then
            config.settings.deno.enable = false
          end
          return false
        end)
      end
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "go", "gomod", "gowork", "gosum" } },
  }
}
