return {
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
