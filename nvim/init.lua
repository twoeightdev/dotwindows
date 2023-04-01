local options = {
    number = true,
    wrap = false,
    signcolumn = "yes",
    colorcolumn = "80",
    hlsearch = false,
    showmode = false,
    smartindent = true,
    showcmd = false,
    splitbelow = true,
    splitright = true,
    backup = false,
    writebackup = false,
    expandtab = true,
    shiftwidth = 4,
    softtabstop = 4,
    swapfile = false,
    tabstop = 4,
    laststatus = 2,
    shortmess = vim.opt.shortmess + 'icw',
    timeoutlen = 300,
    fillchars = {
        eob = ' ',
        vert = '│',
        msgsep = '‾',
        diff = '╱',
        fold = ' ',
        foldopen = '▾',
        foldsep = '│',
        foldclose = '▸'
    },
}

for k, v in pairs(options) do
    vim.opt[k] = v
end