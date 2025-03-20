return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          pick = function(cmd, opts)
            return LazyVim.pick(cmd, opts)()
          end,
          header = [[
          ██╗███╗   ██╗ ██████╗ ███████╗██╗   ██╗███████╗████████╗███████╗███╗   ███╗ ██████╗██╗██╗  ██╗
          ██║████╗  ██║██╔════╝ ██╔════╝╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║██╔════╝██║╚██╗██╔╝
          ██║██╔██╗ ██║██║  ███╗███████╗ ╚████╔╝ ███████╗   ██║   █████╗  ██╔████╔██║██║     ██║ ╚███╔╝ 
          ██║██║╚██╗██║██║   ██║╚════██║  ╚██╔╝  ╚════██║   ██║   ██╔══╝  ██║╚██╔╝██║██║     ██║ ██╔██╗ 
          ██║██║ ╚████║╚██████╔╝███████║   ██║   ███████║   ██║   ███████╗██║ ╚═╝ ██║╚██████╗██║██╔╝ ██╗
          ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝   ╚═╝   ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝ ╚═════╝╚═╝╚═╝  ╚═╝
          © Juan Bladimir Romero Collazos
        ]],
          -- stylua: ignore
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "p", desc = "Projects", action = ":Telescope projects" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  }
}