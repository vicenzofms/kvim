return {
  'arnamak/stay-centered.nvim',
  lazy = false,
  opts = {},
  config = function()
    vim.keymap.set({ 'n', 'v' }, '<leader>tc', function()
      require('stay-centered').toggle()
      vim.notify 'Toggle Centralizado realizado!'
    end, { desc = 'Toggle centralizado' })
  end,
}
