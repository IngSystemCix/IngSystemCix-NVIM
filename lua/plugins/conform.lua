return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "biome", "eslint" },
        typescript = { "biome", "eslint" },
        javascriptreact = { "biome", "eslint" },
        typescriptreact = { "biome", "eslint" },
        http = { "kulala"}
      },
      formatters = {
        biome = {
          command = "biome",
          args = { "format", "--stdin-file-path", "$FILENAME" },
          stdin = true,
        },
        kulala = {
          command = "kulala-fmt",
          args = { "format", "$FILENAME" },
          stdin = false,
        },
        eslint = {
          command = "eslint",
          args = { "--fix", "$FILENAME" },
          stdin = false,
        },
      },
    },
  },
}

