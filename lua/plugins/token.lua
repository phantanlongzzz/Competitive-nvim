return {
    {
        "ThorstenRhau/token",
        lazy = false,   
        priority = 1000, 
        config = function()
            vim.cmd([[colorscheme token]])
        end,
    },
}