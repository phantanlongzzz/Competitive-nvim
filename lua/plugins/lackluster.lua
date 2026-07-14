return {
  "slugbyte/lackluster.nvim",
  lazy = false,    
  priority = 1000,
  config = function()
    -- LƯU Ý: Phải gọi hàm setup() TRƯỚC khi kích hoạt tên màu
    require("lackluster").setup({
      -- Cấu hình độ trong suốt (Tùy chọn)
      tweak_background = {
        normal = "default",
        telescope = "default",
      },
    })

    -- Chọn 1 trong 3 biến thể màu bên dưới để kích hoạt:
    -- vim.cmd.colorscheme("lackluster")
    -- vim.cmd.colorscheme("lackluster-hack")
    -- vim.cmd.colorscheme("lackluster-mint")
  end,
}
