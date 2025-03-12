{
  programs.nixvim = {
    globals = {
      # Disable useless providers
      loaded_ruby_provider = 0; # Ruby
      loaded_perl_provider = 0; # Perl
      loaded_python_provider = 0; # Python 2
    };

    clipboard = {
      # Use system clipboard
      register = "unnamedplus";

      providers.wl-copy.enable = true;
    };

    opts = {

      updatetime = 100; # Faster completion
      cmdheight = 2; # more space in the neovim command line for displaying messages
      showmode = false; # Dont show the editor mode in status line
      # Line numbers
      #relativenumber = true; # Relative line numbers
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
      incsearch = true; # Incremental search: show match for partly typed search command
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
      
      # Reduce which-key timeout to 250s
      timeoutlen = 250;
      
      # Maximum number of items to show in the popup menu (0 means "use available screen space")
      pumheight = 0;
      
    #  extraConfigLua = ''
   #   local opt = vim.opt
   #   local g = vim.g
    #  local o = vim.o
    #    -- Neovide
   #   if g.neovide then
   #     -- Neovide options
   #     g.neovide_fullscreen = false
   #     g.neovide_hide_mouse_when_typing = false
   #     g.neovide_refresh_rate = 165
   #     g.neovide_cursor_vfx_mode = "ripple"
  #      g.neovide_cursor_animate_command_line = true
  #      g.neovide_cursor_animate_in_insert_mode = true
 #       g.neovide_cursor_vfx_particle_lifetime = 5.0
  #      g.neovide_cursor_vfx_particle_density = 14.0
  #      g.neovide_cursor_vfx_particle_speed = 12.0
  #      g.neovide_transparency = 0.8
#
  #      -- Neovide Fonts
  #      o.guifont = "MonoLisa Trial:Medium:h15"
  #      -- o.guifont = "CommitMono:Medium:h15"
   #     -- o.guifont = "JetBrainsMono Nerd Font:h14:Medium:i"
    #    -- o.guifont = "FiraMono Nerd Font:Medium:h14"
   #     -- o.guifont = "CaskaydiaCove Nerd Font:h14:b:i"
   #     -- o.guifont = "BlexMono Nerd Font Mono:h14:Medium:i"
  #      -- o.guifont = "Liga SFMono Nerd Font:b:h15"
  #    end
  #  '';
    
     };
  };
}
