-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd([[autocmd VimEnter * Screenkey]])
vim.opt.termguicolors = true
vim.cmd([[set termguicolors]])
vim.notify("Welcome IngSystemCix", "info", { title = "Welcome" })

vim.cmd [[ autocmd BufRead,BufNewFile *.graphql,*.gql set filetype=http ]]