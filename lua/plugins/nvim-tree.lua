return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local function my_on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return {
          desc = "nvim-tree: " .. desc,
          buffer = bufnr,
          noremap = true,
          silent = true,
          nowait = true,
        }
      end

      -- Atajos personalizados
      vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
      vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
      vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
      vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
      vim.keymap.set("n", "a", api.fs.create, opts("Create"))
      vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
      vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "<A-H>", api.tree.toggle_hidden_filter, opts("Toggle Hidden"))
	  vim.keymap.set("n", "gr", api.tree.reload, opts("Refresh"))
    end

    require("nvim-tree").setup({
      on_attach = my_on_attach,
      actions = {
        open_file = {
          quit_on_open = false,
        },
      },
      filters = {
        dotfiles = false,
		git_ignored = false,
        custom = {},
      },
	  git = {
		enable = true,       -- Activar integración git para iconos y estados
		ignore = false,      -- No ignorar archivos que están en .gitignore
		timeout = 500,       -- Tiempo para refrescar estado git (ms)
	  },
	  renderer = {
		highlight_git = true,
		icons = {
		  show = {
			file = true,
			folder = true,
			folder_arrow = true,
			git = true,
		  },
		},
	  },
    })
	
	vim.api.nvim_set_hl(0, "NvimTreeGitNew",     { fg = "#00ff00", bold = true })      -- Verde brillante, nuevo archivo
	vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#ff0000", bold = true })      -- Rojo brillante, archivo eliminado
	vim.api.nvim_set_hl(0, "NvimTreeGitRenamed", { fg = "#ffa500", italic = true })    -- Naranja, archivo renombrado
	vim.api.nvim_set_hl(0, "NvimTreeGitIgnored", { fg = "#808080", italic = true })    -- Gris, archivo ignorado
	vim.api.nvim_set_hl(0, "NvimTreeGitStaged",  { fg = "#0000ff", bold = true })      -- Azul, archivo stageado (preparado)
	vim.api.nvim_set_hl(0, "NvimTreeGitConflict",{ fg = "#ff00ff", bold = true })      -- Magenta, conflicto git
	vim.api.nvim_set_hl(0, "NvimTreeGitDirty",   { fg = "#ffff00", bold = true })      -- Amarillo, archivo modificado (dirty)


    -- Abre el árbol automáticamente al iniciar Neovim sin argumentos
    vim.api.nvim_create_autocmd({ "VimEnter" }, {
      callback = function()
        if vim.fn.argc() == 0 then
          require("nvim-tree.api").tree.open()
        end
      end,
    })
  end,
}
