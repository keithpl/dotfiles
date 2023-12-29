local function comment_config()
    local comment = require("Comment")

    comment.setup()
end

return {
    "numToStr/Comment.nvim",
    lazy = false,
    config = comment_config
}
