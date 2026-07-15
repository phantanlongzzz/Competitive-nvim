return {
  "shaunsingh/solarized.nvim",
  lazy = false,    -- Load ngay khi khởi động
  priority = 1000, -- Ưu tiên load trước các plugin khác
  config = function()
    -- vim.g.solarized_italic_comments = true   -- In nghiêng comment
    -- vim.g.solarized_italic_keywords = true   -- In nghiêng từ khóa (if, else, return...)
    -- vim.g.solarized_italic_functions = true  -- In nghiêng tên hàm
    vim.g.solarized_contrast = true          -- Làm nổi bật thanh bên (Nvim-Tree, Telescope)
    vim.g.solarized_disable_background = false
    
    -- Đã xóa dấu trừ ở đây:
    vim.o.background = "light"
    require("solarized").set()
  end,
}
