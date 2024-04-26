local function telescope_config()
    local telescope = require("telescope")
    local ts_builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", ts_builtin.find_files)
    vim.keymap.set("n", "<leader>fg", ts_builtin.live_grep)
    vim.keymap.set("n", "<leader>fb", ts_builtin.buffers)
    vim.keymap.set("n", "<leader>fh", ts_builtin.help_tags)

    telescope.setup()
end

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = telescope_config
}
