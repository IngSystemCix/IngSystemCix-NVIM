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
