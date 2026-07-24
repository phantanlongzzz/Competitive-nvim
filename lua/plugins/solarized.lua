return {
      "shaunsingh/solarized.nvim",
      enabled = false,
      lazy = false,
      priority = 1000,
      config = function()
            vim.g.solarized_italic_comments = true
            vim.g.solarized_italic_keywords = true
            vim.g.solarized_italic_functions = true
            vim.g.solarized_contrast = true
            vim.g.solarized_disable_background = false

            vim.o.background = "light"
            require("solarized").set()
      end,
}
