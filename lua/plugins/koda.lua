return {
  "oskarnurm/koda.nvim",
  lazy = false,
  priority = 1000, 
  config = function()
    require("koda").setup({
      transparent = false,
      theme = {
        dark = "moss",  
        light = "glade",
      },
      
      styles = {
        functions = { bold = true },
        keywords = {},
        comments = { italic = true },
        strings = {},
        constants = {},
      },
    })

    ---vim.cmd("colorscheme koda-light")
  end,
}
