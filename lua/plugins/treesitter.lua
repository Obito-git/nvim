return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {"lua", "bash", "javascript", "typescript", "dart", "java", "c"},
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}