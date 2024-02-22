return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
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
        "elixir",
        "markdown",
        "lua",
        "json",
        "jsonc",
        "terraform",
        "python",
        "rust",
        "regex",
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
        "elixir-ls",
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
        "ansible-language-server",
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = {
          "node_modules",
        },
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        user_default_options = {
          tailwind = true,
        },
      })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-l>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
          -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-h>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
}
