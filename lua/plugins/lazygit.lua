return {
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "LazyGit", "LazyGitConfig" },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Abrir LazyGit (Root Dir)" },
      { "<leader>gG", function() require("lazyvim.util").float_term({ "lazygit" }) end, desc = "Abrir LazyGit en terminal flotante" },
    },
  },
}
