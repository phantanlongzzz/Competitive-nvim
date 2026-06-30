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

keymap.set("n", "<F7>", receive_problem)

keymap.set("n", "<F8>", "<cmd>CompetiTest run<CR>")