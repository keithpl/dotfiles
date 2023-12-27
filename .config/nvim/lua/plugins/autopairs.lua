local function autopairs_config()
    local autopairs = require("nvim-autopairs")

    autopairs.setup({})
end

return {
    "windwp/nvim-autopairs",
    lazy = true,
    event = "InsertEnter",
    config = autopairs_config
}
