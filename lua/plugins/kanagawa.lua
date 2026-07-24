-- Đường dẫn gợi ý: C:/Users/asus/AppData/Local/nvim/lua/plugins/kanagawa.lua

return {
      {
            "rebelot/kanagawa.nvim",
            lazy = false,      -- Không lazy load để theme được load ngay từ đầu
            priority = 1000,   -- Ưu tiên load trước các plugin khác để tránh lỗi màu
            config = function()
                  -- (Tùy chọn) Cấu hình chi tiết cho Kanagawa nếu muốn
                  require('kanagawa').setup({
                        compile = false,             -- Bật tính năng compile để tăng tốc độ load (nếu cần)
                        undercurl = true,            -- Bật gợn sóng cho lỗi chính tả
                        commentStyle = { italic = true },
                        functionStyle = {},
                        keywordStyle = { italic = true },
                        statementStyle = { bold = true },
                        typeStyle = {},
                        transparent = false,         -- Đổi thành true nếu muốn dùng nền trong suốt (transparent background)
                        dimInactive = false,         -- Làm tối các cửa sổ không active
                        terminalColors = true,       -- Định nghĩa màu cho terminal tích hợp
                        theme = "wave",              -- Chọn style: "wave" (mặc định), "dragon", hoặc "lotus"
                        background = {               -- Màu nền cho các mode sáng/tối
                              dark = "wave",
                              light = "lotus"
                        },
                  })

                  -- Kích hoạt theme
                  vim.cmd("colorscheme kanagawa")
            end,
      },
}