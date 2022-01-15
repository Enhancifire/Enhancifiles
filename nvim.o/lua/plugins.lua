local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
        execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
        execute 'packadd packer.nvim'
end

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Simple plugins can be specified as strings
  use '9mm/vim-closer'

  -- Lazy loading:
  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }



  -- Plugins can have post-install/update hooks
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Post-install/update hook with call of vimscript function with argument
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }



  -- You can specify multiple plugins in a single call
  use {'tjdevries/colorbuddy.vim'}

  use 'ryanoasis/vim-devicons'


  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'tjdevries/nlua.nvim'

  -- Emmet
  use 'mattn/emmet-vim'

  -- Themes
  use 'joshdick/onedark.vim'
  use 'morhetz/gruvbox'

  -- Nerdtree
  use 'scrooloose/nerdtree'


  -- Cheat Sheet
  use 'dbeniamine/cheat.sh-vim'

  -- Auto-pair
  use 'jiangmiao/auto-pairs'

  -- Snippets
  use 'honza/vim-snippets'
  use 'sirver/ultisnips'

  -- CSS Color Preview
  use 'ap/vim-css-color'

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzf-native.nvim'
  use 'hrsh7th/nvim-compe'

  -- Galaxyline
  use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
}
end)
