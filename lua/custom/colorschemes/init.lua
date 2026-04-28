-- Para adicionar seus próprios temas basta adicioná-los a lista abaixo
-- Para garantir que ele sempre seja carregado antes, coloque "priority = 1000" como nos exemplos
-- Para mudar o tema atual apenas na sessão, pode-se usar o Picker, usando <leader>c
local temas = {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
      }
    end,
  },
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  { 'sainnhe/sonokai', priority = 1000 },
  { 'rebelot/kanagawa.nvim', priority = 1000 },
  { 'ellisonleao/gruvbox.nvim', priority = 1000, config = true },
  { 'bluz71/vim-moonfly-colors', name = 'moonfly', lazy = false, priority = 1000 },
  { 'neanias/everforest-nvim', lazy = false, priority = 1000 },
  { 'wtfox/jellybeans.nvim', lazy = false, priority = 1000 },
  { 'ember-theme/nvim', lazy = false, priority = 1000 },
  { 'AstroNvim/astrotheme', lazy = false, priority = 1000, opts = {
    pallete = 'astrodark',
  } },
  { 'EdenEast/nightfox.nvim', lazy = false, priority = 1000 },
  { 'mrpbennett/boo-berry.nvim', lazy = false, priority = 1000 },
}
return temas
