vim.g.mapleader = " "

vim.cmd([[
    map <leader>df :lua vim.diagnostic.open_float(0, {scope = "line"})<CR>
]])
