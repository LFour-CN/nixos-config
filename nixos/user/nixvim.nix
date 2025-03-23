{pkgs, config, nixvim, ...}:
{
  programs.nixvim = {
    enable = true;
    opts = {
      updatetime = 100; # Faster completion
      cmdheight = 2; # more space in the neovim command line for displaying messages
      showmode = true; # Dont show the editor mode in status line
      # Line numbers
      relativenumber = false; # Relative line numbers
      number = true; # Display the absolute line number of the current line 
      hidden = true; # Keep closed buffer open in the background
      mouse = "a"; # Enable mouse control
      mousemodel = "extend"; # Mouse right-click extends the current selection
      splitbelow = true; # A new window is put below the current one
      splitright = true; # A new window is put right of the current one
      backup = false;
      swapfile = false; # Disable the swap file
      modeline = true; # Tags such as 'vim:ft=sh'
      modelines = 100; # Sets the type of modelines
      undofile = true; # Automatically save and restore undo history
      inccommand = "split"; # Search and replace: preview changes in quickfix list
      ignorecase = true; # When the search query is lower-case, match both lower and upper-case
      # patterns
      smartcase = true; # Override the 'ignorecase' option if the search pattern contains upper
      grepprg = "rg --vimgrep";
      grepformat = "%f:%l:%c:%m";
      # case characters
      scrolloff = 8; # Number of screen lines to show around the cursor
      cursorline = true; # Highlight the screen line of the cursor
      cursorcolumn = false; # Highlight the screen column of the cursor
      signcolumn = "yes"; # Whether to show the signcolumn
      laststatus = 3; # When to use a status line for the last window
      fileencoding = "utf-8"; # File-content encoding for the current buffer
      termguicolors = true; # Enables 24-bit RGB color in the |TUI|
      spell = false; # Highlight spelling mistakes (local to window)
      # Tab options
      tabstop = 2; # Number of spaces a <Tab> in the text stands for (local to buffer)
      softtabstop = 2;
      shiftwidth = 2; # Number of spaces used for each step of (auto)indent (local to buffer)
      expandtab = true; # Expand <Tab> to spaces in Insert mode (local to buffer)
      autoindent = true; # Do clever autoindenting
      textwidth = 0; # Maximum width of text that is being inserted.  A longer line will be
      # broken after white space to get this width.
      # code folding
      foldcolumn = "0";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;
      # misc
      wrap = true;
      background = "dark";
      # Incremental search
      hlsearch = true;
      incsearch = true;
      # Reduce which-key timeout to 250s
      timeoutlen = 250;
      # Maximum number of items to show in the popup menu (0 means "use available screen space")
      pumheight = 0;
    };
    extraConfigLua = ''
    
      -- background
      vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
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
    
    -- catppuccin
    {
      "catppuccin/nvim",
      name = "catppuccin",
      event = "VimEnter",
      priority = 1000, -- make sure it's loaded first
      opts = {
        flavour = "mocha",
        transparent_background = false, -- turn off transparency
      },
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
      
   '';
  };
}

