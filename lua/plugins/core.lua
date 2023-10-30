return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "storm" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "html",
        "css",
        "yaml",
        "bash",
        "go",
        "markdown",
        "lua",
        "json",
        "terraform",
        "python",
        "rust",
        "javascript",
        "typescript",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "css-lsp",
        "eslint-lsp",
        "gopls",
        "html-lsp",
        "jedi-language-server",
        "lua-language-server",
        "marksman",
        "prettier",
        "rust-analyzer",
        "stylua",
        "tailwindcss-language-server",
        "terraform-ls",
        "typescript-language-server",
        "yaml-language-server",
      },
    },
  },
}
