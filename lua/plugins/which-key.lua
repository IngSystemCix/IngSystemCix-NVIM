local theme = require("utils.theme")

return {
  "folke/which-key.nvim",
  event = "VeryLazy",

  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,

  keys = {
    { "<leader>t", group = "themes" },
    { "<leader>tc", function() theme.set_colorscheme("catppuccin-mocha") end, desc = "Catppuccin Mocha" },
    { "<leader>tl", function() theme.set_colorscheme("catppuccin-latte") end, desc = "Catppuccin Latte" },
    { "<leader>tn", function() theme.set_colorscheme("tokyonight-night") end, desc = "TokyoNight Night" },
    { "<leader>ts", function() theme.set_colorscheme("tokyonight-storm") end, desc = "TokyoNight Storm" },
    { "<leader>tm", function() theme.set_colorscheme("tokyonight-moon") end, desc = "TokyoNight Moon" },
    { "<leader>td", function() theme.set_colorscheme("tokyonight-day") end, desc = "TokyoNight Day" },
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Mostrar Which-Key popup (local bindings)",
    },
  },

  config = function()
    local ok, wk = pcall(require, "which-key")
    if not ok then
      vim.notify("which-key no está disponible", vim.log.levels.WARN)
      return
    end
    wk.setup {}
  end,
}
