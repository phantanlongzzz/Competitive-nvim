return {
  "builtbyleo/oc-2.nvim",
  lazy = false,
  priority = 1000, 
  config = function()
    require('oc2').setup({
      theme = "oc-2-noir", 
      overrides = {},      
    })

    vim.cmd.colorscheme("oc-2-noir")
  end,
}
