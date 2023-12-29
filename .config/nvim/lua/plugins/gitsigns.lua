local function gitsigns_config()
    local gitsigns = require("gitsigns")

    gitsigns.setup()
end

return {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = gitsigns_config
}
