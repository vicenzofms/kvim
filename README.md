<div align="center">

```
 █████   █████  ███                                                      ██████
░░███   ░░███  ░░░                                                      ███░░███
 ░███    ░███  ████   ██████   ██████  ████████    █████████  ██████   ░███ ░░░  █████████████    █████
 ░███    ░███ ░░███  ███░░███ ███░░███░░███░░███  ░█░░░░███  ███░░███ ███████   ░░███░░███░░███  ███░░
 ░░███   ███   ░███ ░███ ░░░ ░███████  ░███ ░███  ░   ███░  ░███ ░███░░░███░     ░███ ░███ ░███ ░░█████
  ░░░█████░    ░███ ░███  ███░███░░░   ░███ ░███    ███░   █░███ ░███  ░███      ░███ ░███ ░███  ░░░░███
    ░░███      █████░░██████ ░░██████  ████ █████  █████████░░██████   █████     █████░███ █████ ██████
     ░░░      ░░░░░  ░░░░░░   ░░░░░░  ░░░░ ░░░░░  ░░░░░░░░░  ░░░░░░   ░░░░░     ░░░░░ ░░░ ░░░░░ ░░░░░░
```

# kvim

**Minha configuração pessoal do Neovim** — uma distro enxuta, em português, nascida do
[kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) e moldada para o meu dia a dia.

[![Neovim](https://img.shields.io/badge/Neovim-0.12+-57A143?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io)
[![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)](https://lua.org)
[![lazy.nvim](https://img.shields.io/badge/lazy.nvim-gerenciador-8B5CF6?style=for-the-badge)](https://github.com/folke/lazy.nvim)
[![Plugins](https://img.shields.io/badge/plugins-47-orange?style=for-the-badge)](./lazy-lock.json)
[![Temas](https://img.shields.io/badge/temas-140%2B-ff69b4?style=for-the-badge)](./lua/custom/colorschemes/init.lua)

</div>

---

## Sumário

- [Sobre](#sobre)
- [Destaques](#destaques)
- [Requisitos](#requisitos)
- [Instalação](#instalação)
- [Estrutura](#estrutura)
- [Funcionalidades](#funcionalidades)
  - [Interface](#interface)
  - [Navegação e busca](#navegação-e-busca)
  - [LSP e diagnósticos](#lsp-e-diagnósticos)
  - [Autocomplete e snippets](#autocomplete-e-snippets)
  - [Formatação](#formatação)
  - [Git](#git)
  - [Temas e transparência](#temas-e-transparência)
  - [Suporte por linguagem](#suporte-por-linguagem)
  - [Qualidade de vida](#qualidade-de-vida)
- [Keymaps](#keymaps)
- [Plugins](#plugins)
- [Personalização](#personalização)
- [Créditos](#créditos)

---

## Sobre

O `kvim` começou como um fork do **kickstart.nvim**, mas hoje é praticamente uma distro própria:
todos os textos de ajuda e descrições de atalhos foram reescritos **em português**, o Telescope
foi trocado pelo ecossistema **snacks.nvim**, e a config ganhou um seletor de temas com
persistência, transparência ajustada glyph por glyph e suporte dedicado a Java e Flutter.

A filosofia é simples:

- **Um arquivo principal legível** — o [`init.lua`](./init.lua) segue comentado de ponta a ponta.
- **Plugins modularizados** — cada plugin extra vive no seu próprio arquivo em `lua/custom/plugins/`.
- **Temas separados da lógica** — a lista de colorschemes fica isolada em `lua/custom/colorschemes/`.
- **Nada de mágica escondida** — se um atalho existe, ele aparece no which-key com descrição em pt-BR.

## Destaques

|                                                                      |                                                                          |
| -------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| 🎨 **Uma pilha de colorschemes** com picker visual e preview ao vivo | 🪟 **Transparência** com um atalho, sem quebrar statusline/tabline       |
| 💾 **Tema persistente** entre sessões (via `shada`)                  | 🔍 **snacks.picker** no lugar do Telescope (arquivos, grep, LSP, temas)  |
| 🌳 **Explorador em sidebar** com preview integrado                   | ⚡ **Dashboard** customizado na abertura                                 |
| 🧠 **LSP para 11 linguagens** com instalação automática via Mason    | ☕ **Java** (nvim-java + jdtls) e 🐦 **Flutter/Dart** prontos de fábrica |
| 💅 **Format on save** com `stylua` e `prettierd`                     | 🇧🇷 **Tudo em português**: descrições, grupos do which-key, dashboard     |
| 🔮 **Flash.nvim** para pular pela tela com 2 teclas                  | 🩹 **Aliases de comando** que perdoam typos (`:Wq`, `:Qa`, ...)          |

## Requisitos

| Ferramenta                           | Para quê                                              |
| ------------------------------------ | ----------------------------------------------------- |
| **Neovim >= 0.11** (testado no 0.12) | base da config                                        |
| `git`                                | lazy.nvim clona os plugins                            |
| `make`, compilador C                 | build do LuaSnip (`jsregexp`) e parsers do Treesitter |
| `ripgrep`                            | busca por conteúdo (`<leader>fs`)                     |
| `fd` _(opcional)_                    | acelera a busca de arquivos                           |
| `lazygit`                            | integração de Git em floating window (`<leader>lg`)   |
| `node` / `npm`                       | LSPs de TS/Angular/Tailwind/HTML e o `prettierd`      |
| **Nerd Font** _(recomendado)_        | ícones do dashboard, explorer e picker                |

> [!NOTE]
> A config vem com `vim.g.have_nerd_font = true`. Se você não usa uma Nerd Font no terminal,
> mude para `false` no topo do [`init.lua`](./init.lua).

## Instalação

```bash
# faça backup da sua config atual, se houver
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

# clone
git clone https://github.com/vicenzofms/kvim ~/.config/nvim

# abra e espere o lazy.nvim + mason terminarem
nvim
```

Na primeira abertura o `lazy.nvim` se instala sozinho, baixa os plugins e o Mason instala os
language servers e formatadores (O JDTLS demora bastante, podendo chegar em vários minutos). Depois disso:

```vim
:Lazy          " status dos plugins
:Mason         " status dos LSPs/ferramentas
:checkhealth   " diagnóstico geral
```

## Estrutura

```
.
├── init.lua                        # opções, keymaps, autocmds, LSP, completion, treesitter
├── lazy-lock.json                  # versões travadas dos plugins
├── .stylua.toml                    # estilo do formatador de Lua
├── doc/
│   └── kickstart.txt               # doc herdada do kickstart
└── lua/
    ├── custom/
    │   ├── colorschemes/
    │   │   └── init.lua            # a lista de temas — mexa aqui pra adicionar/remover
    │   └── plugins/                # um arquivo por plugin extra
    │       ├── flash.lua           # movimentação por labels
    │       ├── flutter.lua         # flutter-tools
    │       ├── git-blame.lua       # blame inline
    │       ├── java.lua            # nvim-java + jdtls
    │       ├── markdown.lua        # render-markdown
    │       ├── match.lua           # UI de search & replace
    │       ├── smart-paste.lua     # paste com indentação corrigida
    │       ├── snacks.lua          # dashboard, picker, explorer, notifier, lazygit
    │       ├── stay-centered.lua   # cursor sempre no meio da tela
    │       └── transparent.lua     # transparência + ajustes de highlight
    └── kickstart/
        ├── health.lua
        └── plugins/                # módulos opcionais do kickstart (só autopairs ativo)
```

## Funcionalidades

### Interface

- **Dashboard** ([snacks.dashboard](https://github.com/folke/snacks.nvim)) com header em ASCII art,
  atalhos rápidos (achar arquivo, novo arquivo, explorer, grep, ir para as configurações, Lazy, sair)
  e a lista de **arquivos recentes**.
- **Statusline e tabline** do `mini.nvim` — a posição do cursor é exibida como `LINHA:COLUNA`.
- **Guias de indentação** animadas (`snacks.indent`) e **scroll suave** (`snacks.scroll`).
- **Notificações** em estilo compacto com histórico consultável (`snacks.notifier`).
- **which-key** com `delay = 0`: os atalhos aparecem no instante em que você pressiona o leader,
  já agrupados em `Buffers`, `Splits`, `Arquivos` e `Lazy (e outros)`.
- **Números relativos**, `cursorline`, `scrolloff = 10` e substituição com preview ao vivo (`inccommand = split`).

### Navegação e busca

- **snacks.picker** substitui o Telescope (que segue no arquivo, mas desativado):
  - `smart` picker de arquivos com título e preview customizados;
  - grep no projeto com preview e ícone do arquivo;
  - pickers de LSP (definições, referências, implementações, símbolos);
  - `node_modules` e `dist` excluídos por padrão.
- **snacks.explorer** como sidebar à direita, com 35 colunas, arquivos ocultos/ignorados visíveis
  e painel de preview embaixo.
- **flash.nvim** para saltar por labels — `s` na tela inteira, `S` por nós do Treesitter,
  além dos modos remote e treesitter-search.
- **stay-centered.nvim** mantém o cursor sempre no centro vertical (alternável por atalho).
- **mini.ai** e **mini.surround** para textobjects e manipulação de delimitadores.

### LSP e diagnósticos

Servidores gerenciados pelo Mason e habilitados automaticamente:

`clangd` · `gopls` · `pyright` · `rust_analyzer` · `ts_ls` · `svelte` · `cssls` · `html` ·
`angularls` · `tailwindcss` · `lua_ls` · `jdtls` (via nvim-java) · `dartls` (via flutter-tools)

Ajustes próprios:

- **Angular**: `angularls` com filetypes de TS/HTML/TSX/`htmlangular` e root detectado por
  `angular.json`, `package.json` ou `tsconfig.json`.
- **Tailwind**: reconhece `templ`, `vue`, `astro`, `svelte`, `htmlangular` e trata `scss` como `css`.
- **Lua**: `lazydev.nvim` dá completion e assinaturas da própria API do Neovim.
- **Diagnósticos** com borda arredondada, ordenação por severidade, sublinhado apenas em erros
  e virtual text com a fonte quando houver mais de uma.
- **Highlight automático de referências** do símbolo sob o cursor.
- **Inlay hints** alternáveis por buffer.
- **fidget.nvim** mostra o progresso do LSP no canto.

### Autocomplete e snippets

- **blink.cmp** com preset `enter` (Enter aceita a sugestão), `<C-f>` para abrir o menu,
  `<C-j>`/`<C-k>` para navegar e documentação automática após 500 ms.
- Fontes: **LSP**, **path**, **snippets** e **lazydev** (com prioridade elevada em arquivos Lua).
- **LuaSnip** + **friendly-snippets**, com histórico e matcher fuzzy em Rust quando disponível.
- **Signature help** ativo enquanto você digita os argumentos.

### Formatação

- **conform.nvim** com **format on save** (timeout de 1s, fallback para o LSP).
  `c` e `cpp` ficam de fora por não terem estilo padronizado.
- `stylua` para Lua e `prettierd` para TS/JS/TSX/JSX, CSS, HTML, `htmlangular`, JSON, YAML,
  TOML e Markdown.
- Formatação manual em `<leader>fm`.
- **guess-indent.nvim** detecta `tabstop`/`shiftwidth` do arquivo aberto (padrão: 2 espaços).
- **nvim-ts-autotag** fecha e renomeia tags HTML/JSX automaticamente, inclusive em `htmlangular`.
- **nvim-autopairs** para parênteses, chaves e quotes.

### Git

- **lazygit** em janela flutuante com `<leader>lg`.
- **blame_line.nvim**: blame inline no formato `tempo • autor`, com datas relativas, desligado
  por padrão e alternável em `<leader>tg`.
- **todo-comments.nvim** destaca `TODO`, `FIXME`, `NOTE` e afins nos comentários.

### Temas e transparência

Os repositórios de tema já empacotados (todos com `priority = 1000`) — como a maioria deles traz
várias variantes, a lista final que aparece no picker passa das **140 opções**:

`tokyonight` · `catppuccin` · `sonokai` · `kanagawa` · `gruvbox-material` · `moonfly` ·
`everforest` · `jellybeans` · `ember` · `astrotheme` · `nightfox` · `boo-berry` · `thorn` ·
`national-parks`

- **Picker de temas** em `<leader>c` — o título da janela mostra o **tema atual** e o preview
  troca as cores enquanto você navega pela lista.
- **Persistência**: o tema escolhido é salvo em `vim.g.CURR_COLO` no `shada` e restaurado na
  próxima abertura do Neovim. O padrão, se nunca houve escolha, é `tokyonight-moon`.
- **transparent.nvim** com `<leader>tt`: fundo transparente preservando os modos da statusline,
  além de um conjunto de highlights recalibrados manualmente (comentários, números de linha,
  abas inativas, caminhos do picker e do dashboard) para continuarem legíveis sem fundo.

### Suporte por linguagem

| Linguagem                           | O que vem configurado                                                           |
| ----------------------------------- | ------------------------------------------------------------------------------- |
| **Java**                            | `nvim-java` com jdtls 1.60.0, `spring-boot.nvim` e `nvim-dap` como dependências |
| **Dart / Flutter**                  | `flutter-tools.nvim` carregado no start                                         |
| **TypeScript / Angular**            | `ts_ls` + `angularls` + autotag + `prettierd`                                   |
| **Tailwind CSS**                    | LSP com lista ampliada de filetypes                                             |
| **Lua**                             | `lua_ls` + `lazydev` + `stylua`                                                 |
| **Markdown**                        | `render-markdown.nvim` renderiza títulos, listas e código no buffer             |
| **Go, Rust, Python, C/C++, Svelte** | LSP instalado e habilitado automaticamente                                      |

### Qualidade de vida

- **Aliases de comando** para os typos clássicos com Shift preso: `:W`, `:Wa`, `:Wq`, `:Wqa`,
  `:Q`, `:Qa` — todos aceitam `!` e argumentos.
- **smart-paste.nvim** corrige a indentação do texto colado.
- **Clipboard do sistema** integrado, com detecção de **WSL** (usa `clip.exe`/PowerShell).
- **Undo persistente** entre sessões (`undofile`).
- `confirm = true`: sair com alterações pendentes pergunta antes de descartar.
- Highlight no texto copiado (yank).
- Splits novos abrem à direita e abaixo.
- Busca case-insensitive, exceto quando você digita maiúsculas (`smartcase`).

## Keymaps

> Leader = <kbd>Espaço</kbd>

### Arquivos e busca

| Atalho                 | Ação                                              |
| ---------------------- | ------------------------------------------------- |
| `<leader>ff`           | Achar arquivos (smart picker)                     |
| `<leader>fs`           | Achar string no projeto (grep)                    |
| `<leader>fe`           | Abrir explorador de arquivos                      |
| `<leader>fm`           | Formatar o buffer                                 |
| `s` / `S`              | Flash: pular na tela / pular por nó do Treesitter |
| `<leader>mo`           | Abrir UI de search & replace                      |
| `<leader>mw`           | Search & replace na palavra sob o cursor          |
| `<leader>nh` · `<Esc>` | Limpar o highlight da busca                       |

### Janelas e buffers

| Atalho                          | Ação                              |
| ------------------------------- | --------------------------------- |
| `<C-h>` `<C-j>` `<C-k>` `<C-l>` | Mover o foco entre janelas        |
| `<leader>sv` / `<leader>sh`     | Dividir na vertical / horizontal  |
| `<leader>se` / `<leader>sx`     | Igualar tamanhos / fechar janela  |
| `<leader>bn` / `<leader>bp`     | Próximo / anterior buffer         |
| `<leader>bo`                    | Novo buffer                       |
| `<leader>bx` / `<leader>bd`     | Fechar buffer / fechar sem salvar |

### LSP

| Atalho        | Ação                                         |
| ------------- | -------------------------------------------- |
| `grd` / `grD` | Ir para definição / declaração               |
| `grr` / `gri` | Referências / implementações                 |
| `grt`         | Definição de tipo                            |
| `grn` / `gra` | Renomear / code action                       |
| `gO` / `gW`   | Símbolos do documento / da workspace         |
| `<leader>q`   | Diagnósticos na lista de quickfix            |
| `<leader>do`  | Mostrar diagnóstico em janela flutuante      |
| `<leader>th`  | Toggle inlay hints                           |
| `K`           | Documentação do símbolo _(padrão do Neovim)_ |

### Autocomplete

| Atalho              | Ação                            |
| ------------------- | ------------------------------- |
| `<CR>`              | Aceitar a sugestão              |
| `<C-f>`             | Abrir o menu de completion      |
| `<C-j>` / `<C-k>`   | Item seguinte / anterior        |
| `<C-space>`         | Abrir documentação              |
| `<Tab>` / `<S-Tab>` | Navegar pelos campos do snippet |

### Toggles

| Atalho       | Ação                |
| ------------ | ------------------- |
| `<leader>tt` | Transparência       |
| `<leader>tw` | Line wrap           |
| `<leader>tc` | Cursor centralizado |
| `<leader>tg` | Git blame inline    |

### Outros

| Atalho                      | Ação                                            |
| --------------------------- | ----------------------------------------------- |
| `<leader>c`                 | Picker de temas (mostra o tema atual no título) |
| `<leader>lg`                | Abrir LazyGit                                   |
| `<leader>lL` / `<leader>lm` | Abrir Lazy / Mason                              |
| `<leader>nn`                | Histórico de notificações                       |
| `<leader>va`                | Selecionar o arquivo todo                       |
| `<A-j>` / `<A-k>`           | Mover a linha para baixo / cima                 |
| `<Esc><Esc>`                | Sair do modo terminal                           |

> Esqueceu algum? Pressione <kbd>Espaço</kbd> e deixe o **which-key** te lembrar.

## Plugins

<details>
<summary><b>Ver os 47 plugins instalados</b></summary>

**Gerenciamento e core**
`lazy.nvim` · `plenary.nvim` · `nui.nvim` · `nvim-web-devicons`

**Interface**
`snacks.nvim` (dashboard, picker, explorer, notifier, indent, scroll, lazygit) · `mini.nvim`
(statusline, tabline, ai, surround) · `which-key.nvim` · `fidget.nvim` · `transparent.nvim`

**LSP e ferramentas**
`nvim-lspconfig` · `mason.nvim` · `mason-lspconfig.nvim` · `mason-tool-installer.nvim` ·
`lazydev.nvim` · `nvim-java` · `spring-boot.nvim` · `flutter-tools.nvim` · `nvim-dap`

**Completion e snippets**
`blink.cmp` · `LuaSnip` · `friendly-snippets`

**Edição**
`nvim-treesitter` · `nvim-ts-autotag` · `nvim-autopairs` · `conform.nvim` · `guess-indent.nvim` ·
`flash.nvim` · `stay-centered.nvim` · `smart-paste.nvim` · `match.nvim` · `todo-comments.nvim` ·
`render-markdown.nvim`

**Git**
`blame_line.nvim`

**Temas**
`tokyonight.nvim` · `catppuccin` · `sonokai` · `kanagawa.nvim` · `gruvbox-material` · `moonfly` ·
`everforest-nvim` · `jellybeans.nvim` · `ember-theme/nvim` · `astrotheme` · `nightfox.nvim` ·
`boo-berry.nvim` · `thorn.nvim` · `national-parks-themes`

</details>

Módulos do kickstart que ficam disponíveis mas **desligados** (basta descomentar a linha no
`init.lua`): `debug` (DAP), `indent_line`, `lint`, `neo-tree`, `gitsigns`. O Telescope também
continua no arquivo com `enabled = false`, caso você prefira voltar a ele.

## Personalização

**Adicionar um plugin** — crie um arquivo em `lua/custom/plugins/`:

```lua
-- lua/custom/plugins/meu-plugin.lua
return {
  'autor/meu-plugin.nvim',
  event = 'VeryLazy',
  opts = {},
}
```

O `{ import = 'custom.plugins' }` no `init.lua` carrega tudo dessa pasta automaticamente.

**Adicionar um tema** — inclua a spec na lista de `lua/custom/colorschemes/init.lua` com
`priority = 1000` para garantir que ele carregue antes dos outros plugins. Ele aparece no picker
de `<leader>c` na hora.

**Trocar o tema padrão** — o tema é persistido automaticamente; para mudar o fallback, edite a
última linha do `init.lua`:

```lua
if vim.g.CURR_COLO == nil then
  vim.g.CURR_COLO = 'tokyonight-moon'
end
```

## Créditos

Construído sobre o [**kickstart.nvim**](https://github.com/nvim-lua/kickstart.nvim) (MIT) e sobre
o trabalho de toda a comunidade de plugins listada acima — em especial
[folke](https://github.com/folke), cujos `snacks.nvim`, `which-key.nvim`, `flash.nvim` e
`lazy.nvim` formam a espinha dorsal desta config.

<div align="center">
<sub>Feito com ☕ por <a href="https://github.com/vicenzofms">Vicenzo Fonseca</a></sub>
</div>
