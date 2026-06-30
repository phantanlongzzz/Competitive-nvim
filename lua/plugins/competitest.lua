return {
    {
        "xeluxee/competitest.nvim",
        lazy = false,
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("competitest").setup({
                template_file = {
                    cpp = "C:/Users/asus/AppData/Local/nvim/templates/template.cpp",
                    py = "C:/Users/asus/AppData/Local/nvim/templates/template.py",
                },

                received_files_extension = "cpp",

                runner_ui = {
                    interface = "split",
                },

                compile_command = {
                    cpp = {
                        exec = "g++",
                        args = {
                            "-std=c++20",
                            "-O2",
                            "-Wall",
                            "$(FNAME)",
                            "-o",
                            "$(FNOEXT).exe", -- Thêm thẳng .exe vào đây để g++ xuất ra file chuẩn Windows
                        },
                    },
                },

                run_command = {
                    cpp = {
                        exec = "$(FNOEXT).exe", -- Bỏ ./ đi, chỉ để tên file .exe
                    },
                    py = {
                        exec = "python",
                        args = { "$(FNAME)" },
                    },
                },
            })
        end,
    }
}