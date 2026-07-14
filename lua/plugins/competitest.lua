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

                testcases_directory = "testcases", 
                testcases_use_single_file = false,

                compile_command = {
                    cpp = {
                        exec = "g++",
                        args = {
                            "-std=c++20",
                            "-O2",
                            "-Wall",
                            "$(FNAME)",
                            "-o",
                            "bin/$(FNOEXT).exe", 
                        },
                    },
                },

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
        end,

        
    }
}