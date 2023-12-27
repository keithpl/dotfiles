local function trouble_config()
    local trouble = require("trouble")

    vim.keymap.set("n", "<leader>xx", trouble.toggle)

    vim.keymap.set("n", "<leader>xw", function()
        trouble.toggle("workspace_diagnostics")
    end)
    vim.keymap.set("n", "<leader>xd", function()
        trouble.toggle("document_diagnostics")
    end)
    vim.keymap.set("n", "<leader>xq", function()
        trouble.toggle("quickfix")
    end)
    vim.keymap.set("n", "<leader>xl", function()
        trouble.toggle("loclist")
    end)
    vim.keymap.set("n", "<leader>gR", function()
        trouble.toggle("lsp_references")
    end)

    trouble.setup({})
end

return {
    "folke/trouble.nvim",
    lazy = true,
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    keys = {
        { "<leader>xx" },
        { "<leader>xw" },
        { "<leader>xd" },
        { "<leader>xq" },
        { "<leader>xl" },
        { "<leader>gR" }
    },
    config = trouble_config
}
