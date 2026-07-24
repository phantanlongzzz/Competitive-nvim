require("config.options")
require("config.keymaps")
require("config.lazy")


-- Hàm tạo nội dung header theo thời gian hiện tại
local function get_header()
      local date_string = os.date("%a %d %b %Y %H:%M:%S")
      
      return {
            "/**",
            " *     author: _int32t_wolf",
            " *    created: " .. date_string .. " DaLat, Vietnam",
            " **/",
            "" -- Dòng trống bên dưới header để tách với code
      }
end
-- Tự động chèn header nếu file .cpp hoàn toàn trống (dành cho lúc Competitest tạo file)
vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
      pattern = { "*.cpp", "*.js", "*.ts", "*.json", "*.html" },
      callback = function()
            -- Kiểm tra xem file có trống hoàn toàn không (dung tích = 0 dòng hoặc dòng đầu tiên trống)
            local line_count = vim.api.nvim_buf_line_count(0)
            local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
            
            if line_count == 1 and (first_line == nil or first_line == "") then
                  vim.api.nvim_buf_set_lines(0, 0, 0, false, get_header())
                  vim.api.nvim_win_set_cursor(0, {6, 0})
            end
      end,
})
-- 2. TẠO PHÍM TẮT ĐỂ CẬP NHẬT HOẶC CHÈN THỦ CÔNG
vim.keymap.set("n", "<F4>", function()
      local current_header = get_header() -- Header mới của bạn gồm 5 dòng (0 đến 4)
      
      -- Kiểm tra xem dòng đầu tiên có phải là mở đầu header không
      local line1 = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
      
      if line1 == "/**" then
            -- Tìm xem dòng nào là " **/" (kết thúc header cũ) để xóa đúng phạm vi
            local lines = vim.api.nvim_buf_get_lines(0, 0, 15, false) -- Quét 15 dòng đầu
            local end_index = 0
            for i, line in ipairs(lines) do
                  if line == " **/" then
                        end_index = i -- Vị trí dòng kết thúc header
                        break
                  end
            end
            
            if end_index > 0 then
                  -- Xóa từ dòng đầu tiên đến hết header cũ (bao gồm cả dòng trống thừa nếu có)
                  -- Sau đó chèn header mới vào đúng chỗ đó
                  vim.api.nvim_buf_set_lines(0, 0, end_index + 1, false, current_header)
            else
                  -- Trường hợp hiếm hoi thiếu thẻ đóng thì chèn lên đầu
                  vim.api.nvim_buf_set_lines(0, 0, 0, false, current_header)
            end
      else
            -- Nếu chưa có header thì chèn thẳng lên đầu file, giữ nguyên toàn bộ code bên dưới
            vim.api.nvim_buf_set_lines(0, 0, 0, false, current_header)
      end
      
      print("Đã cập nhật Header thời gian mới nhất mà không mất code!")
end, { desc = "Cap nhat Header ngày giờ an toàn" })