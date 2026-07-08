return {
  {
    "Mofiqul/dracula.nvim",
    lazy = false, 
    priority = 1000, 
    config = function()
      local dracula = require("dracula")
      dracula.setup({
        transparent_bg = false,    
        italic_comment = true,     
        show_end_of_buffer = true,

      })

      vim.cmd([[colorscheme dracula]])
    end,
  },
}
