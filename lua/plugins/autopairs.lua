return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    check_ts = true, -- Không tự đóng ngoặc nếu đang gõ bên trong chuỗi (string) hoặc comment
    disable_filetype = { "TelescopePrompt", "spectre_panel" }, -- Tắt ở các cửa sổ đặc biệt
  },
  config = function(_, opts)
    local autopairs = require("nvim-autopairs")
    autopairs.setup(opts)

    -- Tự động đóng ngoặc tròn () khi bạn chọn một hàm/function từ menu gợi ý code (nvim-cmp)
    local cmp_status, cmp = pcall(require, "cmp")
    if cmp_status then
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
  end,
}
