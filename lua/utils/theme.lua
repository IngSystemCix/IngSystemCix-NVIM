local M = {}
local notify = require("notify")

function M.set_colorscheme(name)
  vim.cmd("colorscheme " .. name)
  notify("Theme changed to: " .. name, "info", { title = "Theme" })
end

return M
