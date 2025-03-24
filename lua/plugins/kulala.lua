return {
  {
    "mistweaverco/kulala.nvim",
    ft = {"http", "rest", "graphql"},
    keys = {
      { "<leader>R", "", desc = "+Rest" },
      { "<leader>Rb", "<cmd>lua require('kulala').scratchpad()<cr>", desc = "Open scratchpad" },
      { "<leader>Rc", "<cmd>lua require('kulala').copy()<cr>", desc = "Copy as cURL" },
      { "<leader>RC", "<cmd>lua require('kulala').from_curl()<cr>", desc = "Paste from curl" },
      { "<leader>Rg", "<cmd>lua require('kulala').download_graphql_schema()<cr>", desc = "Download GraphQL schema" },
      { "<leader>Ri", "<cmd>lua require('kulala').inspect()<cr>", desc = "Inspect current request" },
      { "<leader>Rn", "<cmd>lua require('kulala').jump_next()<cr>", desc = "Jump to next request" },
      { "<leader>Rp", "<cmd>lua require('kulala').jump_prev()<cr>", desc = "Jump to previous request" },
      { "<leader>Rq", "<cmd>lua require('kulala').close()<cr>", desc = "Close window" },
      { "<leader>Rr", "<cmd>lua require('kulala').replay()<cr>", desc = "Replay the last request" },
      { "<leader>Rs", "<cmd>lua require('kulala').run()<cr>", desc = "Send the request" },
      { "<leader>RS", "<cmd>lua require('kulala').show_stats()<cr>", desc = "Show stats" },
      { "<leader>Rt", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle headers/body" },
    },
    opts = {
      global_keymaps = false,
      kulala_keymaps = true,
      curl_path = "curl",
      contenttypes = {
        ["application/json"] = {
          ft = "json",
          formatter = vim.fn.executable("jq") == 1 and { "jq", "." },
          pathresolver = function(...)
            return require("kulala.parser.jsonpath").parse(...)
          end,
        },
      },
      ui = {
        display_mode = "split",
        split_direction = "horizontal",
        default_view = "body",
        winbar = true,
        default_winbar_panes = { "body", "headers", "headers_body", "verbose", "script_output", "report", "help" },
        show_variable_info_text = true,
        show_icons = "on_request",
        icons = {
          inlay = {
            loading = "⏳",
            done = "✅",
            error = "❌",
          },
          lualine = "🐼",
          textHighlight = "WarningMsg", -- highlight group for request elapsed time
        },
        show_request_summary = true,
      }
    },
  }
}
