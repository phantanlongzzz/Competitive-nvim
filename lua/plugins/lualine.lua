-- return {
--     {
--         "nvim-lualine/lualine.nvim",

--         dependencies = {
--             "nvim-tree/nvim-web-devicons",
--         },

--         config = function()
--             require("lualine").setup({
--                 options = {
--                     theme = "auto",
--                     component_separators = "",
--                     section_separators = "",
--                 },
--                 sections = {
--                     lualine_x = { "filetype" }, -- Chỉ giữ lại loại file (như cpp, lua), bỏ utf-8 và icon hệ điều hành
--                 },
--             })
--         end,
--     }
-- }

return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                    icons_enabled = true,
                    
                    section_separators = { left = "", right = "" },
                    component_separators = { left = "", right = "" },
                    
                    globalstatus = true,
                },
                sections = {
                    lualine_a = { "mode" },
                    
                    lualine_b = { "branch", "diff" },
                    
                    lualine_c = { "diagnostics", "filename" },
                    
                    lualine_x = { "filetype" },
                    
                    lualine_y = { "progress" },
                    
                    lualine_z = { "location" },
                },
                tabline = {},
            })
        end,
    }
}
