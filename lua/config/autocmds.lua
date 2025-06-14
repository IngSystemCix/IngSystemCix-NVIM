-- This file is automatically loaded by lazyvim.config.init.

local notify = require("notify")

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "checkhealth",
    "dbout",
    "gitsigns-blame",
    "grug-far",
    "help",
    "lspinfo",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})

-- make it easier to close man-files when opened inline
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("man_unlisted"),
  pattern = { "man" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("json_conceal"),
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- notify when a file was saved
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    notify("File saved: " .. vim.fn.expand("%:t"), "info", { title = "Saved" })
  end,
})

-- code actions for null-ls

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "null-ls" then
      client.server_capabilities.codeActionProvider = true
    end
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyUpdate",
  callback = function()
    notify("Actualizando plugins...", "info", { title = "LazyVim" })
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  callback = function()
    notify("Plugins actualizados correctamente.", "info", { title = "LazyVim" })
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyReload",
  callback = function()
    notify("Se detectaron cambios en la configuración. Recargando Neovim...", "warn", { title = "LazyVim" })
  end,
})

-- colors of nvim-tree

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local api = vim.api
    api.nvim_set_hl(0, "NvimTreeGitNew",     { fg = "#00ff00", bold = true })
    api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#ff0000", bold = true })
    api.nvim_set_hl(0, "NvimTreeGitRenamed", { fg = "#ffa500", italic = true })
    api.nvim_set_hl(0, "NvimTreeGitIgnored", { fg = "#808080", italic = true })
    api.nvim_set_hl(0, "NvimTreeGitStaged",  { fg = "#0000ff", bold = true })
    api.nvim_set_hl(0, "NvimTreeGitConflict",{ fg = "#ff00ff", bold = true })
    api.nvim_set_hl(0, "NvimTreeGitDirty",   { fg = "#ffff00", bold = true })
  end,
})
