return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- last release is too old and doesn't work on Windows
  build = ":TSUpdate",
  event = { "LazyFile", "VeryLazy" },
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  keys = {
    { "<bs>", desc = "Decrement Selection", mode = "x" },
  },
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "angular",
      "scss",
      "bash",
      "c",
      "diff",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "printf",
      "python",
      "query",
      "regex",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
      "http",
      "graphql"
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
    textobjects = {
      move = {
        enable = true,
        goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
        goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
        goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
        goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
      },
    },
  },
  config = function(_, opts)
    -- Asegurarse de que Angular esté incluido correctamente
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "angular", "scss" })
    end

    -- Crear autocmds para manejar archivos Angular correctamente
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
      pattern = { "*.component.html", "*.container.html" },
      callback = function()
        -- Verifica si ya está cargado el parser de Angular
        if not vim.treesitter.language_exists("angular") then
          vim.treesitter.install("angular")
        end
        vim.treesitter.start(nil, "angular")
      end,
    })

    -- Se asegura de que otros lenguajes como TypeScript y JSX también estén instalados
    vim.list_extend(opts.ensure_installed, {
      "tsx",
      "typescript",
    })
  end,
}
