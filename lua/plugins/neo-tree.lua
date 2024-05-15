return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set('n', '<leader>n', ':Neotree<CR>', {})
        require("neo-tree").setup({
          filesystem = {
            follow_current_file = {
              enabled = true
            },
            filtered_items = {
              visible = true,
              show_hidden_count = true,
              hide_dotfiles = false,
              hide_gitignore = false
            }
          }
        }) 
    end
}
