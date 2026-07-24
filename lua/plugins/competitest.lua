-- return {
--       {
--             "xeluxee/competitest.nvim",
--             lazy = false,
--             dependencies = {
--                   "MunifTanjim/nui.nvim",
--             },
--             config = function()
--                   require("competitest").setup({
--                         template_file = {
--                               cpp = "C:/Users/asus/AppData/Local/nvim/templates/template.cpp",
--                               py = "C:/Users/asus/AppData/Local/nvim/templates/template.py",
--                         },

--                         received_files_extension = "cpp",

--                         runner_ui = {
--                               interface = "split",
--                         },

--                         testcases_directory = "testcases",
--                         testcases_use_single_file = false,

--                         compile_command = {
--                               cpp = {
--                                     exec = "g++",
--                                     args = {
--                                           "-std=c++23",
--                                           "-O2",
--                                           "-Wall",
--                                           "$(FNAME)",
--                                           "-o",
--                                           "bin/$(FNOEXT).exe",
--                                     },
--                               },
--                         },

--                         run_command = {
--                               cpp = {
--                                     exec = "bin/$(FNOEXT).exe",
--                               },
--                               py = {
--                                     exec = "python",
--                                     args = { "$(FNAME)" },
--                               },
--                         },
--                   })
--             end,
--       },
-- }

return {
      {
            "xeluxee/competitest.nvim",
            lazy = false,
            dependencies = {
                  "MunifTanjim/nui.nvim",
            },
            config = function()
                  require("competitest").setup({
                        -- Cấu hình đường dẫn Template
                        template_file = {
                              cpp = "C:/Users/asus/AppData/Local/nvim/templates/template.cpp",
                              py = "C:/Users/asus/AppData/Local/nvim/templates/template.py",
                        },

                        received_files_extension = "cpp",

                        -- Giao diện chạy thử (UI)
                        runner_ui = {
                              interface = "split",
                              show_nu = true,
                              show_sign = false,
                              split_pos = "right",
                              split_size = 0.4,
                        },

                        -- Cấu hình Testcases
                        testcases_directory = "testcases",
                        testcases_use_single_file = false,
                        testcases_auto_detect_storage = true,

                        -- Lệnh biên dịch (Compile)
                        compile_command = {
                              cpp = {
                                    exec = "g++",
                                    args = {
                                          "-std=c++23",
                                          "-O2",
                                          "-Wall",
                                          "$(FNAME)",
                                          "-o",
                                          "bin/$(FNOEXT).exe",
                                    },
                              },
                        },

                        -- Lệnh chạy thực thi (Run)
                        run_command = {
                              cpp = {
                                    exec = "bin/$(FNOEXT).exe",
                              },
                              py = {
                                    exec = "python",
                                    args = { "$(FNAME)" },
                              },
                        },
                  })

                  -- ==========================================================
                  -- PHÍM TẮT TIỆN ÍCH (Keymaps)
                  -- ==========================================================
                  local opts = { silent = true }

                  -- F5 để chạy testcases hiện tại
                  vim.keymap.set('n', '<F5>', '<cmd>CompetiTest run<CR>', vim.tbl_extend('force', opts, { desc = 'CompetiTest Run' }))

                  -- F6 để mở menu quản lý testcases
                  vim.keymap.set('n', '<F6>', '<cmd>CompetiTest edit_testcases<CR>', vim.tbl_extend('force', opts, { desc = 'CompetiTest Edit Testcases' }))
            end,
      },
}
