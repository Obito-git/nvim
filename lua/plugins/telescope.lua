return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope_builtin = require("telescope.builtin")
        vim.keymap.set('n', '<leader>o', telescope_builtin.find_files, {})
        vim.keymap.set('n', '<leader>f', telescope_builtin.live_grep, {})
        vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
        vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  }
}
