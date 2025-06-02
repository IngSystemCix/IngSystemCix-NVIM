local M = {}

function M.set_nvim_tree_git_highlights()
  vim.api.nvim_set_hl(0, "NvimTreeGitNew",     { fg = "#00ff00", bold = true })
  vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#ff0000", bold = true })
  vim.api.nvim_set_hl(0, "NvimTreeGitRenamed", { fg = "#ffa500", italic = true })
  vim.api.nvim_set_hl(0, "NvimTreeGitIgnored", { fg = "#808080", italic = true })
  vim.api.nvim_set_hl(0, "NvimTreeGitStaged",  { fg = "#0000ff", bold = true })
  vim.api.nvim_set_hl(0, "NvimTreeGitConflict",{ fg = "#ff00ff", bold = true })
  vim.api.nvim_set_hl(0, "NvimTreeGitDirty",   { fg = "#ffff00", bold = true })
end

function M.setup()
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      M.set_nvim_tree_git_highlights()
    end,
  })

  -- Aplica los colores al iniciar Neovim
  M.set_nvim_tree_git_highlights()
end

return M