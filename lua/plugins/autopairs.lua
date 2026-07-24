return {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      opts = {
            check_ts = true,
            disable_filetype = { "TelescopePrompt", "spectre_panel" },
      },
      config = function(_, opts)
            local autopairs = require("nvim-autopairs")
            autopairs.setup(opts)

            local Rule = require("nvim-autopairs.rule")
            local cond = require("nvim-autopairs.conds")

            autopairs.add_rules({
                  Rule(" ", " "):with_pair(function(options)
                        local pair = options.line:sub(options.col - 1, options.col)
                        return vim.tbl_contains({ "{}" }, pair)
                  end),
                  Rule("{\n", "}")
                        :with_pair(cond.none())
                        :with_move(cond.none())
                        :with_del(cond.none()),
            })

            local cmp_status, cmp = pcall(require, "cmp")
            if cmp_status then
                  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
                  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
            end
      end,
}
