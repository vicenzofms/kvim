local M = {
  'nvim-java/nvim-java',
  config = function()
    require('java').setup({
      jdtls = {
        version = '1.60.0',
      },
    })
    vim.lsp.enable 'jdtls'
  end,
}
return M
