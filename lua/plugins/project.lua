return {
  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = false,
      detection_methods = { "lsp", "pattern" },
      patterns = { ".git", "package.json", "Makefile", "CMakeLists.txt", "pom.xml", "build.gradle", ".idea", ".vscode" },
      
      datapath = vim.fn.stdpath("data"),
    },
    event = "VeryLazy",
    config = function(_, opts)
      require("project_nvim").setup(opts)
      local history = require("project_nvim.utils.history")
      history.delete_project = function(project)
        for k, v in pairs(history.recent_projects) do
          if v == project.value then
            history.recent_projects[k] = nil
            return
          end
        end
      end
      LazyVim.on_load("telescope.nvim", function()
        require("telescope").load_extension("projects")
      end)

      -- Keymaps
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      -- Abrir selector de proyectos
      map("n", "<leader>fp", "<cmd>Telescope projects<cr>", opts)

      -- Abrir el último proyecto en la lista
      map("n", "<leader>flp", function()
        local recent_projects = require("project_nvim.utils.history").recent_projects
        if #recent_projects > 0 then
          vim.cmd("cd " .. recent_projects[1])
          print("Cambiado a " .. recent_projects[1])
        else
          print("No hay proyectos recientes")
        end
      end, opts)

      -- Eliminar un proyecto del historial
      map("n", "<leader>fdp", function()
        local project = require("telescope.actions.state").get_selected_entry()
        if project then
          history.delete_project(project)
          print("Proyecto eliminado del historial")
        end
      end, opts)
    end,
  }
}
