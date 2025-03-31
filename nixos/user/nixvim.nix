{ nixvim, ... }: {
  programs.nixvim = {
    enable = true;
    extraConfigLua = ''
          
            -- lazy.nvim
            local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
      if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
        if vim.v.shell_error ~= 0 then
          vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
          }, true, {})
          vim.fn.getchar()
          os.exit(1)
        end
      end
      vim.opt.rtp:prepend(lazypath)
      require("lazy").setup({
        spec = {
        
          -- add LazyVim and import its plugins
          { "LazyVim/LazyVim",
            import = "lazyvim.plugins"
          },

          -- disable mason.nvim
          {
            "williamboman/mason.nvim",
            enabled = false
          },

          -- colorscheme  
          {
             "folke/tokyonight.nvim",
             lazy = false,
             priority = 1000,
             opts = {
               style = "night",
               transparent = true,
             },
             config = function(_, opts)
               require("tokyonight").setup(opts)
               vim.cmd.colorscheme("tokyonight")
             end,
          },


          -- snacks.nvim
          {
            "snacks.nvim",
            event = "VimEnter",
            opts = {
              dashboard = {
                preset = {
                  header = [[
          ███╗   ██╗ ██╗   ██╗ ██╗ ███╗   ███╗    
          ████╗  ██║ ██║   ██║ ██║ ████╗ ████║    
          ██╔██╗ ██║ ██║   ██║ ██║ ██╔████╔██║    
          ██║╚██╗██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║    
          ██║ ╚████║  ╚████╔╝  ██║ ██║ ╚═╝ ██║    
          ╚═╝  ╚═══╝   ╚═══╝   ╚═╝ ╚═╝     ╚═╝    
                 ]],
                  header_opts = {
                    spacing = 2,
                    align = "center",
                  },
                  keys = {
                    { icon = "󰈞 ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    { icon = " ", key = "t", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                    { icon = " ", key = "e", desc = "Extras", action = ":LazyExtras" },
                    { icon = " ", key = "s", desc = "Settings", action = ":Lazy" },
                    { icon = "󰗼 ", key = "q", desc = "Quit", action = ":qa" },
                  },
                  keys_opts = {
                    spacing = 1,
                    hl = "SnacksDashboardKey",
                    align = "center",
                  },
                  footer = function()
                    return "  " .. os.date("%R")
                  end,
                  footer_opts = {
                    hl = "SnacksDashboardFooter",
                    align = "center",
                  },
                },
                highlight = {
                  key = { fg = "#FFD700" },
                  desc = { fg = "#808080" },
                  footer = { fg = "#808080" },
                },
              },
            },
          },
          
          -- import/override with your plugins
          -- { import = "plugins" },
          
        },
        defaults = {
          -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
          -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
          lazy = false,
          -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
          -- have outdated releases, which may break your Neovim install.
          version = false, -- always use the latest git commit
          -- version = "*", -- try installing the latest stable version for plugins that support semver
        },
        install = { colorscheme = { "tokyonight", "habamax" } },
        checker = {
          enabled = true, -- check for plugin updates periodically
          notify = false, -- notify on update
        }, -- automatically check for plugin updates
        performance = {
          rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
              "gzip",
              -- "matchit",
              -- "matchparen",
              -- "netrwPlugin",
              "tarPlugin",
              "tohtml",
              "tutor",
              "zipPlugin",
            },
          },
        },
      })

          vim.opt.relativenumber = false

    '';
  };
}

