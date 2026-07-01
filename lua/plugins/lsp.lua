-- return {
--     {
--         "neovim/nvim-lspconfig",
--         dependencies = { "hrsh7th/cmp-nvim-lsp" },
--         config = function()
--             local capabilities = require("cmp_nvim_lsp").default_capabilities()

--             vim.lsp.config("clangd", {
--                 cmd = {
--                     "clangd",
--                     "--background-index",
--                     "--clang-tidy",
--                     "--header-insertion=never",
--                 },
--                 capabilities = capabilities,
--             })

--             vim.lsp.enable("clangd")

--             vim.api.nvim_create_autocmd("LspAttach", {
--                 callback = function(args)
--                     local opts = { buffer = args.buf }
--                     vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) 
--                     vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)       
--                 end,
--             })
--         end,
--     },

--     -- 2. Bộ Autocompletion (Hiện bảng menu khi gõ)
--     {
--         "hrsh7th/nvim-cmp",
--         dependencies = {
--             "hrsh7th/cmp-nvim-lsp",
--             "hrsh7th/cmp-buffer",
--             "hrsh7th/cmp-path",
--         },
--         config = function()
--             local cmp = require("cmp")
--             cmp.setup({
--                 mapping = cmp.mapping.preset.insert({
--                     ["<C-Space>"] = cmp.mapping.complete(), 
--                     ["<CR>"] = cmp.mapping.confirm({ select = true }), 
--                 }),
--                 sources = cmp.config.sources({
--                     { name = "nvim-lsp" },
--                     { name = "buffer" },
--                     { name = "path" },
--                 }),
--             })
--         end,
--     },
-- }

return {
    -- 1. Cấu hình hệ thống LSP gốc của Neovim v0.11+ (Bỏ qua nvim-lspconfig cũ)
    {
        "neovim/nvim-lspconfig",
        dependencies = { "hrsh7th/cmp-nvim-lsp" },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- ĐĂNG KÝ CẤU HÌNH: Dùng API gốc của Neovim để cấu hình Clangd
            vim.lsp.config("clangd", {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=never",
                },
                capabilities = capabilities,
            })

            -- KÍCH HOẠT HIỂN THỊ LỖI (Diagnostics) cho hệ thống gốc
            vim.diagnostic.config({
                virtual_text = { prefix = "●" }, -- Hiện chữ báo lỗi mờ cuối dòng
                signs = true,                    -- Hiện chữ E, W ở rìa trái màn hình
                underline = true,                -- Gạch chân đoạn code bị lỗi
                update_in_insert = true,
            })

            -- Kích hoạt Clangd hoạt động
            vim.lsp.enable("clangd")

            -- Phím tắt tương tác nhanh khi LSP hoạt động
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local opts = { buffer = args.buf }
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                end,
            })
        end,
    },

    -- 2. Bộ Autocompletion (Giữ nguyên)
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(), 
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), 
                }),
                sources = cmp.config.sources({
                    { name = "nvim-lsp" },
                    { name = "buffer" },
                    { name = "path" },
                }),
            })
        end,
    },
}