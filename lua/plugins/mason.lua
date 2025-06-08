return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        -- Formatters
        "stylua",
        "shfmt",
        "prettier",
        "black",
        -- Linters
        "eslint_d",
        "pylint",
        "markdownlint-cli2",
        -- LSPs
        "angular-language-server",
        "typescript-language-server",
        "lua-language-server",
        "emmet-language-server",
        "graphql-language-service-cli",
        "python-lsp-server",
        "biome",
        -- go
        "goimports",
        "gofumpt",
        "gomodifytags",
        "impl",
        "delve",
        -- tailwindcss
        "tailwindcss-language-server",
      },
      automatic_installation = true,
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")

      mr:on("package:install:success", function()
        vim.defer_fn(function()
          require("lazy.core.handler.event").trigger({
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          })
        end, 100)
      end)

      mr.refresh(function()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end)
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "mason.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.diagnostics.pylint,
          null_ls.builtins.diagnostics.markdownlint,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.formatting.black,
          -- htmlhint custom removido
        },
      })
    end,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = { "mason.nvim", "null-ls.nvim" },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          "eslint_d",
          "pylint",
          "markdownlint-cli2",
          -- "htmlhint" removido
          "prettier",
          "stylua",
          "shfmt",
          "black",
        },
        automatic_installation = true,
      })
    end,
  },
}
