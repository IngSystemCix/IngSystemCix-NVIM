return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "biome", "eslint" },
        typescript = { "biome", "eslint" },
        javascriptreact = { "biome", "eslint" },
        typescriptreact = { "biome", "eslint" },
      },
      formatters = {
        biome = {
          command = "biome",
          args = { "format", "--stdin-file-path", "$FILENAME" },
          stdin = true,
        },
      },
    },
  },
}

