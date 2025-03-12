{
 programs.nixvim = {
  globals = {
      mapleader = " ";
      maplocalleader = " ";
 };
 
  plugins = {
    which-key = {
    enable = true;
    settings = {
      spec = [
        # Settings groups
        {
          __unkeyed-1 = "<leader>g";
          group = "Git";
        }
        {
          __unkeyed-1 = "<leader><tab>";
          group = "Tabs";
        }
        {
          __unkeyed-1 = "<leader>f";
          group = "File / Find";
        }
        {
          __unkeyed-1 = "<leader>q";
          group = "Quit / Session";
        }
        {
          __unkeyed-1 = "<leader>s";
          group = "Search";
        }
        {
          __unkeyed-1 = "<leader>b";
          group = "Buffer";
        }
        {
          __unkeyed-1 = "<leader>o";
          group = "SOPS";
          icon = "";
        }
        {
          __unkeyed-1 = "<leader>d";
          group = "Debug";
          icon = "";
        }
        {
          __unkeyed-1 = "<leader>c";
          group = "Code Actions";
          icon = "";
        }
        {
          __unkeyed-1 = "<leader>d/";
          group = "Search";
          icon = "";
        }
        {
          __unkeyed-1 = "<leader>D";
          group = "Database";
          icon = "";
        }

        # Keys with custom icons / labels
        {
          __unkeyed-1 = "<leader>e";
          icon = "󰏇";
          desc = "Oil";
        }
        {
          __unkeyed-1 = "<leader>/";
          icon = "";
          desc = "Live Grep";
        }
        {
          __unkeyed-1 = "<leader>da";
          icon = "";
          desc = "Run with Args";
        }
        {
          __unkeyed-1 = "<leader>db";
          icon = "";
          desc = "Toggle Breakpoint";
        }
        {
          __unkeyed-1 = "<leader>dB";
          icon = "";
          desc = "Breakpoint Condition";
        }
        {
          __unkeyed-1 = "<leader>dc";
          icon = "";
          desc = "Continue";
        }
        {
          __unkeyed-1 = "<leader>dC";
          icon = "";
          desc = "Run to cursor";
        }
        {
          __unkeyed-1 = "<leader>de";
          icon = "󰫧";
          desc = "Eval";
        }
        {
          __unkeyed-1 = "<leader>dg";
          icon = "";
          desc = "Go to line (no execute)";
        }
        {
          __unkeyed-1 = "<leader>di";
          icon = "󰆹";
          desc = "Step into";
        }
        {
          __unkeyed-1 = "<leader>dj";
          icon = "";
          desc = "Down";
        }
        {
          __unkeyed-1 = "<leader>dk";
          icon = "";
          desc = "Up";
        }
        {
          __unkeyed-1 = "<leader>dl";
          icon = "";
          desc = "Run Last";
        }
        {
          __unkeyed-1 = "<leader>do";
          icon = "";
          desc = "Step Out";
        }
        {
          __unkeyed-1 = "<leader>dO";
          icon = "";
          desc = "Step Over";
        }
        {
          __unkeyed-1 = "<leader>dp";
          icon = "";
          desc = "Pause";
        }
        {
          __unkeyed-1 = "<leader>dt";
          icon = "";
          desc = "Terminate";
        }
        {
          __unkeyed-1 = "<leader>ca";
          icon = "󱐋";
          desc = "Code Actions";
        }
        {
          __unkeyed-1 = "<leader>cr";
          icon = "󰑕";
          desc = "Rename";
        }
        {
          __unkeyed-1 = "<leader>wa";
          icon = "󱑾";
          desc = "Add Workspace Folder";
        }
        {
          __unkeyed-1 = "<leader>wr";
          icon = "";
          desc = "Remove Workspace Folder";
        }
        {
          __unkeyed-1 = "<leader>wr";
          icon = "󰉓";
          desc = "List Workspace Folders";
        }
        {
          __unkeyed-1 = "<leader>h";
          icon = "󱡅";
          desc = "Harpoon";
        }
       ];
     };
   };
 };
 
  keymaps = [
    # Windows
    {
      mode = "n";
      key = "<C-Up>";
      action = "<C-w>k";
      options.desc = "Move To Window Up";
    }

    {
      mode = "n";
      key = "<C-Down>";
      action = "<C-w>j";
      options.desc = "Move To Window Down";
    }

    {
      mode = "n";
      key = "<C-Left>";
      action = "<C-w>h";
      options.desc = "Move To Window Left";
    }

    {
      mode = "n";
      key = "<C-Right>";
      action = "<C-w>l";
      options.desc = "Move To Window Right";
    }

    {
      mode = "n";
      key = "<leader>wd";
      action = "<C-W>c";
      options = {
        silent = true;
        desc = "Delete window";
      };
    }

    {
      mode = "n";
      key = "<leader>-";
      action = "<C-W>s";
      options = {
        silent = true;
        desc = "Split window below";
      };
    }

    {
      mode = "n";
      key = "<leader>|";
      action = "<C-W>v";
      options = {
        silent = true;
        desc = "Split window right";
      };
    }

    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>w<cr><esc>";
      options = {
        silent = true;
        desc = "Save file";
      };
    }

    # Quit/Session
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>quitall<cr><esc>";
      options = {
        silent = true;
        desc = "Quit all";
      };
    }

    # Toggle options
    {
      mode = "n";
      key = "<leader>ul";
      action = ":lua ToggleLineNumber()<cr>";
      options = {
        silent = true;
        desc = "Toggle Line Numbers";
      };
    }

    {
      mode = "n";
      key = "<leader>uL";
      action = ":lua ToggleRelativeLineNumber()<cr>";
      options = {
        silent = true;
        desc = "Toggle Relative Line Numbers";
      };
    }

    {
      mode = "n";
      key = "<leader>uw";
      action = ":lua ToggleWrap()<cr>";
      options = {
        silent = true;
        desc = "Toggle Line Wrap";
      };
    }

    # Move Lines
    {
      mode = "n";
      key = "<A-Up>";
      action = "<cmd>m .-2<cr>==";
      options.desc = "Move line up";
    }

    {
      mode = "v";
      key = "<A-Up>";
      action = ":m '<-2<cr>gv=gv";
      options.desc = "Move line up";
    }

    {
      mode = "n";
      key = "<A-Down>";
      action = "<cmd>m .+1<cr>==";
      options.desc = "Move line down";
    }

    {
      mode = "v";
      key = "<A-Down>";
      action = ":m '>+1<cr>gv=gv";
      options.desc = "Move line Down";
    }

    # Better indenting
    {
      mode = "v";
      key = "<";
      action = "<gv";
    }

    {
      mode = "v";
      key = ">";
      action = ">gv";
    }

    {
      mode = "i";
      key = "<C-a>";
      action = "<cmd> norm! ggVG<cr>";
      options.desc = "Select all lines in buffer";
    }

    {
      mode = "n";
      key = "J";
      action = "mzJ`z";
      options.desc = "Allow cursor to stay in the same place after appending to current line ";
    }

    # {
    #   mode = "n";
    #   key = "<C-d>";
    #   action = "<C-d>zz";
    #   options.desc = "Allow C-d and C-u to keep the cursor in the middle";
    # }
    #
    # {
    #   mode = "n";
    #   key = "<C-u>";
    #   action = "<C-u>zz";
    #   options.desc = "Allow C-d and C-u to keep the cursor in the middle";
    # }

    {
      mode = "n";
      key = "n";
      action = "nzzzv";
      options.desc = "Allow search terms to stay in the middle";
    }

    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
      options.desc = "Allow search terms to stay in the middle";
    }

    # Clear search with ESC
    {
      mode = [
        "n"
        "i"
      ];
      key = "<esc>";
      action = "<cmd>noh<cr><esc>";
      options = {
        silent = true;
        desc = "Escape and clear hlsearch";
      };
    }

    # Paste stuff without saving the deleted word into the buffer
    {
      mode = "x";
      key = "p";
      action = "\"_dP";
      options.desc = "Deletes to void register and paste over";
    }

    # Copy stuff to system clipboard with <leader> + y or just y to have it just in vim
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>y";
      action = "\"+y";
      options.desc = "Copy to system clipboard";
    }

    # Delete to void register
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>D";
      action = "\"_d";
      options.desc = "Delete to void register";
    }
  ];
 };
}
