local opt = vim.opt
vim.opt.laststatus = 0

-------------------------------------------------------------------------------
-- 1. Cấu hình hiển thị và giao diện (UI)
-------------------------------------------------------------------------------
opt.number = true           -- Hiển thị số dòng
opt.relativenumber = true   -- Hiển thị số dòng tương đối (giúp jump dòng cực nhanh)
opt.numberwidth = 4         -- Độ rộng của cột số dòng
vim.o.signcolumn = "no"     -- Tắt cột sign (bỏ khoảng trống thừa bên trái)
opt.wrap = false            -- Không tự động xuống dòng khi text quá dài
opt.termguicolors = true    -- Bật màu sắc 24-bit (giúp giao diện chuẩn màu hơn)

-------------------------------------------------------------------------------
-- 2. Cấu hình Tab và Thụt lề (Thích hợp cho C/C++, Java)
-------------------------------------------------------------------------------
opt.tabstop = 2             -- 1 tab bằng 4 khoảng trắng
opt.shiftwidth = 2          -- Kích thước thụt lề khi dùng lệnh > hoặc <
opt.expandtab = true        -- Chuyển đổi Tab thành dấu cách tự động
opt.smartindent = true      -- Tự động căn lề thông minh khi xuống dòng mới

-------------------------------------------------------------------------------
-- 3. Đồng bộ Hệ điều hành
-------------------------------------------------------------------------------
-- Giúp bạn copy code trong Neovim (bằng lệnh y) rồi dán trực tiếp lên web Codeforces được ngay
opt.clipboard = "unnamedplus" 

-------------------------------------------------------------------------------
-- 4. Tự động chuyển thư mục làm việc (Workdir)
-------------------------------------------------------------------------------
-- Mở neovim trống (lệnh nvim) sẽ tự động nhảy vào kho bài tập Codeforces
vim.api.nvim_create_autocmd("VimEnter", {
    desc = "Tu dong chuyen den thu muc Codeforces khi mo nvim trong",
    callback = function()
        if vim.fn.argc() == 0 then
            vim.cmd("cd E:\\IT_Workspace\\02_Competitive\\Codeforces")
        end
    end,
})

-------------------------------------------------------------------------------
-- 5. Cấu hình Màu sắc (Colorscheme & Highlights)
-------------------------------------------------------------------------------
-- vim.api.nvim_create_autocmd("ColorScheme", {
--     group = vim.api.nvim_create_augroup("CustomLineNumberColor", { clear = true }),
--     pattern = "*",
--     callback = function()
--         -- Áp dụng màu vàng Gold đậm và chữ đậm cho số dòng
--         vim.api.nvim_set_hl(0, "LineNr", { fg = "#D4AF37", bold = true })
--         vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#D4AF37", bold = true })
--     end,
-- })

-------------------------------------------------------------------------------
-- 6. TÍNH NĂNG BỔ SUNG: Tự động lưu file khi mất focus (Rất cần khi cày thuật toán)
-------------------------------------------------------------------------------
-- Khi bạn chuyển tab ra ngoài màn hình (ví dụ: bấm Alt+Tab sang trình duyệt đọc đề bài)
-- Neovim sẽ tự động lưu file code
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
    pattern = "*",
    command = "silent! wa",
})
