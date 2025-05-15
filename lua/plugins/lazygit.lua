return {
  { "nvim-lua/plenary.nvim" },
  { "akinsho/toggleterm.nvim", config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
      })
  end },
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "LazyGit", "LazyGitConfig" },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Abrir LazyGit (Root Dir)" },
      { "<leader>gG", function()
        require("toggleterm.terminal").Terminal:new({
          cmd = "lazygit",
          direction = "float",
          hidden = true,
        }):toggle()
      end, desc = "Abrir LazyGit en terminal flotante" },    
    },
  },
}
