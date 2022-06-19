require("paq-nvim")({
  "savq/paq-nvim"; -- Let paq manage itself

  -- Core
  "neovim/nvim-lspconfig";
  "hrsh7th/nvim-compe"; -- Completion
  "hrsh7th/vim-vsnip"; -- Snippets for vim (from VSCode's LSP)
  "simrat39/symbols-outline.nvim"; -- Tree-like view for symbols
  "nvim-lua/popup.nvim"; -- [WIP] Implementation of Vim's Pop-up API in Neovim
  "nvim-lua/plenary.nvim"; -- All the Lua functions I don't want to write twice
  "ggandor/lightspeed.nvim"; -- For quick and efficient on-screen navigation
  "ThePrimeagen/harpoon"; -- For quick and efficient between-files navigation
  "glepnir/lspsaga.nvim"; -- The extension plugin for LSP (with a highly performant UI)
  "nvim-treesitter/nvim-treesitter"; -- A Treesitter configurations and abstractions layer for Neovim
  "rmagatti/auto-session"; -- Leverage Neovim's session API to provide seamless automatic session management
  "folke/trouble.nvim"; -- Notifies you about, and perhaps quick-fixes, the troubles your code currently has
  "nvim-telescope/telescope.nvim"; -- The spiritual successor of fuzzy finders
  {"nvim-telescope/telescope-fzy-native.nvim", run='git submodule update --init --recursive'}; -- Luajit FFI bindings to FZY (in Telescope!)

  -- Extensions
  -- 1. Eclipse JDT Language Server
  -- Pre-requisites -> https://github.com/eclipse/eclipse.jdt.ls#first-time-setup
  "mfussenegger/nvim-jdtls"; -- EclipseJDT Language Server extensions for the built-in LSP

  -- Misc
  "b2nj5m1n/kommentary"; -- A Neovim commenting plugin, written in Lua
  "windwp/nvim-autopairs"; -- A Neovim autopairs plugin, written in Lua
  "mhartington/formatter.nvim"; -- A Neovim format runner, written in Lua
  "winston0410/cmd-parser.nvim"; -- A Neovim command-line parser, written in Lua
  "lewis6991/gitsigns.nvim"; -- A Neovim git decorations plugin, written in Lua and Teal

  -- UI
  "kyazdani42/nvim-web-devicons"; -- Icons and glyps for LSP
  "onsails/lspkind-nvim"; -- VSCode-like pictograms for LSP
  "hoob3rt/lualine.nvim"; -- A statusline built with Lua
  "sainnhe/everforest"; -- Colorscheme
})

