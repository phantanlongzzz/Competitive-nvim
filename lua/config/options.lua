local opt = vim.opt

-- Cấu hình hiển thị dòng
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
vim.o.signcolumn = "no"


-- Cấu hình Tab = 2
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Hỗ trợ căn lề và hiển thị
opt.smartindent = true
opt.wrap = false
opt.termguicolors = true

-- Đồng bộ bộ nhớ tạm với hệ điều hành (Copy/Paste ra ngoài)
opt.clipboard = "unnamedplus"

-- Tự động chuyển thư mục làm việc về kho code CF của bạn
vim.cmd("cd E:/gen/cf")
