local keymap = vim.keymap

local function receive_problem()
    vim.ui.select(
        { "cpp", "py" },
        { prompt = "Choose language:" },

        function(choice)
            if not choice then
                return
            end

            require("competitest").setup({
                received_files_extension = choice,
            })

            vim.cmd("CompetiTest receive problem")
        end
    )
end


-- Nhấn F4 để mở Terminal dọc bên phải
vim.keymap.set("n", "<F4>", function()
  local current_dir = vim.fn.expand("%:p:h")

  vim.cmd("vsplit")
  vim.cmd("wincmd l") 
  vim.cmd("vertical resize 45") 

  vim.cmd("lcd " .. vim.fn.fnameescape(current_dir))

  vim.cmd("terminal")

  local win = vim.api.nvim_get_current_win()
  vim.wo[win].number = false          
  vim.wo[win].relativenumber = false  
  vim.wo[win].signcolumn = "no"       
  vim.wo[win].foldcolumn = "0"        
  vim.wo[win].statuscolumn = ""       

  vim.cmd("startinsert")
end, { desc = "Mở Terminal dọc bên phải siêu đẹp" })





keymap.set("n", "<F7>", receive_problem)

keymap.set("n", "<F8>", "<cmd>CompetiTest run<CR>")