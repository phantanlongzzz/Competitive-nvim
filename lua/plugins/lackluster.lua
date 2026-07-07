return {
    {
        "slugbyte/lackluster.nvim",

        lazy = false,
        priority = 1000,

        init = function()
            vim.opt.termguicolors = true

            ---vim.cmd.colorscheme("lackluster-hack")
        end,
    }
}