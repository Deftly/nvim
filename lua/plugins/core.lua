return {
  {
    "folke/noice.nvim",
    optional = true,
    opts = {
      presets = { inc_rename = true },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
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
        "make",
        "markdown",
        "lua",
        "json",
        "jsonc",
        "hcl",
        "terraform",
        "python",
        "rust",
        "regex",
        "javascript",
        "typescript",
        "zig",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "css-lsp",
        -- "eslint-lsp",
        "gopls",
        "elixir-ls",
        "html-lsp",
        -- "jedi-language-server",
        "lua-language-server",
        "marksman",
        "checkmake",
        "prettier",
        "rust-analyzer",
        "stylua",
        "tailwindcss-language-server",
        "terraform-ls",
        "typescript-language-server",
        "yaml-language-server",
        "ansible-language-server",
        "zls",
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
    "goolord/alpha-nvim",
    event = "VimEnter",
    enabled = true,
    init = false,
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      --       local logo = [[
      -- ██╗    ██╗██╗  ██╗ █████╗ ████████╗    ███████╗████████╗ █████╗ ███╗   ██╗██████╗ ███████╗    ██╗███╗   ██╗    ████████╗██╗  ██╗███████╗    ██╗    ██╗ █████╗ ██╗   ██╗
      -- ██║    ██║██║  ██║██╔══██╗╚══██╔══╝    ██╔════╝╚══██╔══╝██╔══██╗████╗  ██║██╔══██╗██╔════╝    ██║████╗  ██║    ╚══██╔══╝██║  ██║██╔════╝    ██║    ██║██╔══██╗╚██╗ ██╔╝
      -- ██║ █╗ ██║███████║███████║   ██║       ███████╗   ██║   ███████║██╔██╗ ██║██║  ██║███████╗    ██║██╔██╗ ██║       ██║   ███████║█████╗      ██║ █╗ ██║███████║ ╚████╔╝
      -- ██║███╗██║██╔══██║██╔══██║   ██║       ╚════██║   ██║   ██╔══██║██║╚██╗██║██║  ██║╚════██║    ██║██║╚██╗██║       ██║   ██╔══██║██╔══╝      ██║███╗██║██╔══██║  ╚██╔╝
      -- ╚███╔███╔╝██║  ██║██║  ██║   ██║       ███████║   ██║   ██║  ██║██║ ╚████║██████╔╝███████║    ██║██║ ╚████║       ██║   ██║  ██║███████╗    ╚███╔███╔╝██║  ██║   ██║
      --  ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝       ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝    ╚═╝╚═╝  ╚═══╝       ╚═╝   ╚═╝  ╚═╝╚══════╝     ╚══╝╚══╝ ╚═╝  ╚═╝   ╚═╝
      --
      --                   ██████╗ ███████╗ ██████╗ ██████╗ ███╗   ███╗███████╗███████╗    ████████╗██╗  ██╗███████╗    ██╗    ██╗ █████╗ ██╗   ██╗
      --                   ██╔══██╗██╔════╝██╔════╝██╔═══██╗████╗ ████║██╔════╝██╔════╝    ╚══██╔══╝██║  ██║██╔════╝    ██║    ██║██╔══██╗╚██╗ ██╔╝
      --                   ██████╔╝█████╗  ██║     ██║   ██║██╔████╔██║█████╗  ███████╗       ██║   ███████║█████╗      ██║ █╗ ██║███████║ ╚████╔╝
      --                   ██╔══██╗██╔══╝  ██║     ██║   ██║██║╚██╔╝██║██╔══╝  ╚════██║       ██║   ██╔══██║██╔══╝      ██║███╗██║██╔══██║  ╚██╔╝
      --                   ██████╔╝███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗███████║       ██║   ██║  ██║███████╗    ╚███╔███╔╝██║  ██║   ██║
      --                   ╚═════╝ ╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚══════╝       ╚═╝   ╚═╝  ╚═╝╚══════╝     ╚══╝╚══╝ ╚═╝  ╚═╝   ╚═╝
      --     ]]

      local logo = [[
██╗     █████╗ ███╗   ███╗    ██████╗ ██╗   ██╗██╗██╗  ████████╗    ██╗   ██╗██████╗  ██████╗ ███╗   ██╗    ████████╗██╗  ██╗███████╗    ███████╗███╗   ███╗ █████╗ ██╗     ██╗     
██║    ██╔══██╗████╗ ████║    ██╔══██╗██║   ██║██║██║  ╚══██╔══╝    ██║   ██║██╔══██╗██╔═══██╗████╗  ██║    ╚══██╔══╝██║  ██║██╔════╝    ██╔════╝████╗ ████║██╔══██╗██║     ██║     
██║    ███████║██╔████╔██║    ██████╔╝██║   ██║██║██║     ██║       ██║   ██║██████╔╝██║   ██║██╔██╗ ██║       ██║   ███████║█████╗      ███████╗██╔████╔██║███████║██║     ██║     
██║    ██╔══██║██║╚██╔╝██║    ██╔══██╗██║   ██║██║██║     ██║       ██║   ██║██╔═══╝ ██║   ██║██║╚██╗██║       ██║   ██╔══██║██╔══╝      ╚════██║██║╚██╔╝██║██╔══██║██║     ██║     
██║    ██║  ██║██║ ╚═╝ ██║    ██████╔╝╚██████╔╝██║███████╗██║       ╚██████╔╝██║     ╚██████╔╝██║ ╚████║       ██║   ██║  ██║███████╗    ███████║██║ ╚═╝ ██║██║  ██║███████╗███████╗
╚═╝    ╚═╝  ╚═╝╚═╝     ╚═╝    ╚═════╝  ╚═════╝ ╚═╝╚══════╝╚═╝        ╚═════╝ ╚═╝      ╚═════╝ ╚═╝  ╚═══╝       ╚═╝   ╚═╝  ╚═╝╚══════╝    ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝
                                                                                                                                                                                    
            ████████╗██╗  ██╗██╗███╗   ██╗ ██████╗ ███████╗    ██╗    ██████╗  ██████╗     ███████╗██╗   ██╗███████╗██████╗ ██╗   ██╗██████╗  █████╗ ██╗   ██╗                      
            ╚══██╔══╝██║  ██║██║████╗  ██║██╔════╝ ██╔════╝    ██║    ██╔══██╗██╔═══██╗    ██╔════╝██║   ██║██╔════╝██╔══██╗╚██╗ ██╔╝██╔══██╗██╔══██╗╚██╗ ██╔╝                      
               ██║   ███████║██║██╔██╗ ██║██║  ███╗███████╗    ██║    ██║  ██║██║   ██║    █████╗  ██║   ██║█████╗  ██████╔╝ ╚████╔╝ ██║  ██║███████║ ╚████╔╝                       
               ██║   ██╔══██║██║██║╚██╗██║██║   ██║╚════██║    ██║    ██║  ██║██║   ██║    ██╔══╝  ╚██╗ ██╔╝██╔══╝  ██╔══██╗  ╚██╔╝  ██║  ██║██╔══██║  ╚██╔╝                        
               ██║   ██║  ██║██║██║ ╚████║╚██████╔╝███████║    ██║    ██████╔╝╚██████╔╝    ███████╗ ╚████╔╝ ███████╗██║  ██║   ██║   ██████╔╝██║  ██║   ██║                         
               ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝    ╚═╝    ╚═════╝  ╚═════╝     ╚══════╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═════╝ ╚═╝  ╚═╝   ╚═╝                         
    ]]

      dashboard.section.header.val = vim.split(logo, "\n")
      -- stylua: ignore
      -- dashboard.section.buttons.val = {
      --   dashboard.button("f", " " .. " Find file",       "<cmd> Telescope find_files <cr>"),
      --   dashboard.button("n", " " .. " New file",        "<cmd> ene <BAR> startinsert <cr>"),
      --   dashboard.button("r", " " .. " Recent files",    "<cmd> Telescope oldfiles <cr>"),
      --   dashboard.button("g", " " .. " Find text",       "<cmd> Telescope live_grep <cr>"),
      --   dashboard.button("c", " " .. " Config",          "<cmd> lua require('lazyvim.util').telescope.config_files()() <cr>"),
      --   dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
      --   dashboard.button("x", " " .. " Lazy Extras",     "<cmd> LazyExtras <cr>"),
      --   dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
      --   dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
      -- }
      --   for _, button in ipairs(dashboard.section.buttons.val) do
      --     button.opts.hl = "AlphaButtons"
      --     button.opts.hl_shortcut = "AlphaShortcut"
      --   end
      --   dashboard.section.header.opts.hl = "AlphaHeader"
      --   dashboard.section.buttons.opts.hl = "AlphaButtons"
      --   dashboard.section.footer.opts.hl = "AlphaFooter"
      --   dashboard.opts.layout[1].val = 8
      --   return dashboard
    end,
    -- config = function(_, dashboard)
    --   -- close Lazy and re-open when the dashboard is ready
    --   if vim.o.filetype == "lazy" then
    --     vim.cmd.close()
    --     vim.api.nvim_create_autocmd("User", {
    --       once = true,
    --       pattern = "AlphaReady",
    --       callback = function()
    --         require("lazy").show()
    --       end,
    --     })
    --   end
    --
    --   require("alpha").setup(dashboard.opts)
    --
    --   vim.api.nvim_create_autocmd("User", {
    --     once = true,
    --     pattern = "LazyVimStarted",
    --     callback = function()
    --       local stats = require("lazy").stats()
    --       local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    --       dashboard.section.footer.val = "⚡ Neovim loaded "
    --         .. stats.loaded
    --         .. "/"
    --         .. stats.count
    --         .. " plugins in "
    --         .. ms
    --         .. "ms"
    --       pcall(vim.cmd.AlphaRedraw)
    --     end,
    --   })
    -- end,
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

      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
}
