local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use({ "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" }) -- Have packer manage itself
  use({ "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" }) -- An implementation of the Popup API from vim in Neovim
  use({ "nvim-lua/plenary.nvim", commit = "62dc2a7acd2fb2581871a36c1743b29e26c60390" }) -- Useful lua functions used ny lots of plugins
  use({ "windwp/nvim-autopairs", commit = "14cc2a4fc6243152ba085cc2059834113496c60a" }) -- Autopairs, integrates with both cmp and treesitter
  use({ "numToStr/Comment.nvim", commit = "70615e63a6dcc41de0e90a7d79bdcec511bda93f" }) -- Easily comment stuff
  use({ "kyazdani42/nvim-tree.lua", commit = "9914780cbabdffe3cd030867f0bc34c6e51bcb95" }) -- Tree file explorer
  use({ "akinsho/bufferline.nvim", commit = "c78b3ecf9539a719828bca82fc7ddb9b3ba0c353" }) -- Add bufferline
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
  use({ "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" }) -- Configurable status line
  use({ "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" }) -- Terminal toggle
  use({ "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" })
  use({ "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" }) -- Speed up loading Lua modules
  use({ "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" }) -- Adds indentation guides
  use({ "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" }) -- Neovim greeter

  -- Colorschemes
  use "lunarvim/colorschemes" -- A bunch of colorschemes
  use "folke/tokyonight.nvim" -- Current favorite

  -- cmp plugins
  use({ "hrsh7th/nvim-cmp", commit = "17a55b3d5498c617855d015bbcad0c872d10c879" }) -- The completion plugin
  use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
  use({ "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" }) -- path completions
  use({ "hrsh7th/cmp-cmdline", commit = "c66c379915d68fb52ad5ad1195cdd4265a95ef1e" }) -- cmdline completions
  use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- snippet completions
  use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" })
  use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })

  -- snippets
  use({ "L3MON4D3/LuaSnip", commit = "d36c063b7f6e701852f7880f1314656592a61b4f" }) --snippet engine
  use({ "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" }) -- a bunch of snippets to use

  -- LSP 
  use({ "neovim/nvim-lspconfig", commit = "db99974928e98685f5b25bd0f6f2c09b0cb15f03" }) -- enable LSP 
  use({ "williamboman/nvim-lsp-installer", commit = "ae913cb4fd62d7a84fb1582e11f2e15b4d597123" }) -- simple to use language server installer 
  use({ "jose-elias-alvarez/null-ls.nvim", commit = "8af89c5fa2b732aaa9c3bf8aed95bccc9c4ce295" }) -- for formatters and linters
  use { "RRethy/vim-illuminate", commit = "c82e6d04f27a41d7fdcad9be0bce5bb59fcb78e5" } -- automatic highlighting
  use {"simrat39/rust-tools.nvim", commit = "11dcd674781ba68a951ab4c7b740553cae8fe671"} -- enhance rust experience nvim

  -- Telescope
  use({ "nvim-telescope/telescope.nvim", commit = "30e2dc5232d0dd63709ef8b44a5d6184005e8602" })
  use({ "nvim-telescope/telescope-media-files.nvim", commit = "513e4ee385edd72bf0b35a217b7e39f84b6fe93c" })
  use({ "tom-anders/telescope-vim-bookmarks.nvim", commit = "92498cbf7c127dea37c3d27117b60dd7ab9baef4" })

  -- Icon 
  use({ "kyazdani42/nvim-web-devicons", commit = "a8cf88cbdb5c58e2b658e179c4b2aa997479b3da"})

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter", commit = "a60aa7b2e1dd9219c6356f65ba48bdbd50090abd",
    run = ":TSUpdate"
  }
  use({ "p00f/nvim-ts-rainbow", commit = "fad8badcd9baa4deb2cf2a5376ab412a1ba41797" })
  use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "4d3a68c41a53add8804f471fcc49bb398fe8de08" })

  -- Git
  use({ "lewis6991/gitsigns.nvim", commit = "231fa923fbc2797eef92b24860ab882cebf645b2" })

  -- DAP
  use { "mfussenegger/nvim-dap", commit = "014ebd53612cfd42ac8c131e6cec7c194572f21d" }
  use { "rcarriga/nvim-dap-ui", commit = "d76d6594374fb54abf2d94d6a320f3fd6e9bb2f7" }
  use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
