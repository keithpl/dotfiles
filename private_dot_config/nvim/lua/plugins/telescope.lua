local function telescope_config()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtin.find_files)
    vim.keymap.set("n", "<leader>fg", builtin.live_grep)
    vim.keymap.set("n", "<leader>fb", builtin.buffers)
    vim.keymap.set("n", "<leader>fh", builtin.help_tags)

    telescope.setup({})
end

return {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    keys = {
        { "<leader>ff" },
        { "<leader>fg" },
        { "<leader>fb" },
        { "<leader>fh" }
    },
    config = telescope_config
}