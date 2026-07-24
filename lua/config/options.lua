local opt = vim.opt
vim.opt.laststatus = 0

opt.number = true
opt.relativenumber = true
opt.numberwidth = 4
vim.o.signcolumn = "no"
opt.wrap = false
opt.termguicolors = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() == 0 then
            vim.cmd("cd D:\\programming\\CF")
        end
    end,
})

opt.showmatch = true
opt.matchtime = 2

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "MatchParen", { fg = "#ffffff", bg = "#e06c75", bold = true })
    end,
})
vim.api.nvim_set_hl(0, "MatchParen", { fg = "#ffffff", bg = "#e06c75", bold = true })

vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
    pattern = "*",
    command = "silent! wa",
})

vim.cmd("colorscheme retrobox")
