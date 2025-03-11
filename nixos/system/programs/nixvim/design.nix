{
 programs.nixvim = {
  plugins = {

  # 1
  alpha = {
      enable = true;
      layout = [
        {
          type = "padding";
          val = 2;
        }
        {
          type = "text";
          val = [
            "      █████ █     ██"
            "   ██████  ██    ████ █                                 █"
            "  ██   █  █ ██    ████                    ██           ███"
            " █    █  █  ██    █ █                     ██            █"
            "     █  █    ██   █                ████    ██    ███"
            "    ██ ██    ██   █       ███     █ ███  █  ██    ███ ███    ███ ████ ████"
            "    ██ ██     ██  █      █ ███   █   ████   ██     ███ ███    ███ ████ ███  █"
            "    ██ ██     ██  █     █   ███ ██    ██    ██      ██  ██     ██  ████ ████"
            "    ██ ██      ██ █    ██    █████    ██    ██      ██  ██     ██   ██   ██"
            "    ██ ██      ██ █    ████████ ██    ██    ██      ██  ██     ██   ██   ██"
            "    █  ██       ███    ███████  ██    ██    ██      ██  ██     ██   ██   ██"
            "       █        ███    ██       ██    ██    ██      █   ██     ██   ██   ██"
            "   ████          ██    ████    █ ██████      ███████    ██     ██   ██   ██"
            "  █  █████              ███████   ████        █████     ███ █  ███  ███  ███"
            " █     ██                █████                           ███    ███  ███  ███"
            " █"
            "  █"
            "   ██"
          ];
          opts = {
            position = "center";
            hl = "Type";
          };
        }
        {
          type = "padding";
          val = 4;
        }
        {
          type = "group";
          val = [
            {
              type = "button";
              val = "      New File    ";
              on_press.__raw = "function() vim.cmd[[ene]] end";
              opts = {
                shortcut = "n";
                keymap = [
                  "n"
                  "n"
                  "<cmd>ene<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                position = "center";
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            {
              type = "padding";
              val = 2;
            }
            {
              type = "button";
              val = "      Find File    ";
              opts = {
                shortcut = "f";
                keymap = [
                  "n"
                  "f"
                  "<cmd>lua require('fzf-lua').files({ cwd = vim.loop.cwd() })<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                position = "center";
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            {
              type = "padding";
              val = 2;
            }
            {
              type = "button";
              val = "      Recent Files    ";
              on_press.__raw = "function() require('telescope.builtin').oldfiles() end";
              opts = {
                shortcut = "r";
                keymap = [
                  "n"
                  "r"
                  "<cmd>lua require('fzf-lua').oldfiles({ cwd = vim.loop.cwd() })<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                position = "center";
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            {
              type = "padding";
              val = 2;
            }
            {
              type = "button";
              val = "      Find Text    ";
              on_press.__raw = "function() require('telescope.builtin').live_grep() end";
              opts = {
                shortcut = "g";
                keymap = [
                  "n"
                  "g"
                  "<cmd>lua require('fzf-lua').live_grep()<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                position = "center";
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            {
              type = "padding";
              val = 2;
            }
            {
              type = "button";
              val = "      Quit Neovim    ";
              on_press.__raw = "function() vim.cmd[[qa]] end";
              opts = {
                shortcut = "q";
                keymap = [
                  "n"
                  "q"
                  "<cmd>qa<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                position = "center";
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
          ];
        }
      ];
    }; 
  
  # 2
  barbar = {
    enable = true;
    keymaps = {
      next.key = "<TAB>";
      previous.key = "<S-TAB>";
      close.key = "<leader>x";
      };
    };

  # 3
  bufferline = {
    enable = true;
    };

  # 4
  fzf-lua = {
      enable = true;
      keymaps = {
        "<leader>/" = {
          action = "live_grep";
          options.desc = "Live Grep";
        };
        "<leader>," = {
          action = "buffers";
          options.desc = "Switch Buffer";
          settings = {
            sort_mru = true;
            sort_lastused = true;
          };
        };
        "<leader>gc" = {
          action = "git_commits";
          options.desc = "Git Commits";
        };
        "<leader>gs" = {
          action = "git_status";
          options.desc = "Git Status";
        };
        "<leader>s\"" = {
          action = "registers";
          options.desc = "Registers";
        };
        "<leader>sd" = {
          action = "diagnostics_document";
          options.desc = "Document Diagnostics";
        };
        "<leader>sD" = {
          action = "diagnostics_workspace";
          options.desc = "Workspace Diagnostics";
        };
        "<leader>sh" = {
          action = "help_tags";
          options.desc = "Help Pages";
        };
        "<leader>sk" = {
          action = "keymaps";
          options.desc = "Key Maps";
        };
      };
    };
  
  # 5
  lualine = {
    enable = true;

    settings = {
      extensions = [ "fzf" ];
      globalstatus = true;

      # +-------------------------------------------------+
      # | A | B | C                             X | Y | Z |
      # +-------------------------------------------------+
      sections = {
        lualine_a = ["mode"];
        lualine_b = ["branch"];
        lualine_c = ["filename" "diff"];

        lualine_x = [
          "diagnostics"

          # Show active language server
          {
            __raw = ''
              function()
                  local msg = ""
                  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                  local clients = vim.lsp.get_active_clients()
                  if next(clients) == nil then
                      return msg
                  end
                  for _, client in ipairs(clients) do
                      local filetypes = client.config.filetypes
                      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                          return client.name
                      end
                  end
                  return msg
              end
            '';
            color = {
              fg = "#ffffff";
            };
          }

          # Add macro recording status to lualine_x section
          {
            __raw = ''
              function()
                  local recording_register = vim.fn.reg_recording()
                  if recording_register == "" then
                      return ""
                  else
                      return "Recording @" .. recording_register
                  end
              end
            '';
            color = {
              fg = "#ff0000"; # Red color to make it noticeable
            };
          }
          "encoding"
          "fileformat"
          "filetype"
        ];
      };
    };
  };

  # 6
  indent-o-matic = {
    enable = true;
  };
  
  # 7
  neo-tree = {
      enable = true;
      enableDiagnostics = true;
      enableModifiedMarkers = true;
      enableRefreshOnWrite = true;
      addBlankLineAtTop = true;
      autoCleanAfterSessionRestore = true;
      closeIfLastWindow = true;
      extraOptions = {};
  };

  # 8
  noice.settings =
  {
    enable = true;
    notify = {
      enabled = true;
    };
    messages = {
      enabled = true; # Adds a padding-bottom to neovim statusline when set to false for some reason
    };
    lsp = {
      message = {
        enabled = false;
      };
      progress = {
        enabled = false;
        view = "mini";
      };
    };
    popupmenu = {
      enabled = true;
      backend = "nui";
    };
    format = {
      filter = {
        pattern = [":%s*%%s*s:%s*" ":%s*%%s*s!%s*" ":%s*%%s*s/%s*" "%s*s:%s*" ":%s*s!%s*" ":%s*s/%s*"];
        icon = "";
        lang = "regex";
      };
      replace = {
        pattern = [":%s*%%s*s:%w*:%s*" ":%s*%%s*s!%w*!%s*" ":%s*%%s*s/%w*/%s*" "%s*s:%w*:%s*" ":%s*s!%w*!%s*" ":%s*s/%w*/%s*"];
        icon = "󱞪";
        lang = "regex";
      };
    };
  };

  # 9
  notify = {
    enable = true;
  };
  
  # 10
  nui = {
    enable = true;
  };
  
  # 11
  oil = {
    enable = true;
    settings = {
       skip_confirm_for_simple_edits = true;
       keymaps = {
        "<C-l>" = false;
        "<C-r>" = "actions.refresh";
        "y." = "actions.copy_entry_path";
        };
      };
    };
  
  # 12
  tagbar = {
      enable = true;
      settings.width = 50;
    };
  
  # 13
  telescope = {
      enable = true;
      settings.defaults = {
        file_ignore_patterns = [
          "^.git/"
          "^.mypy_cache/"
          "^__pycache__/"
          "^output/"
          "^data/"
          "%.ipynb"
        ];
        set_env.COLORTERM = "truecolor";
      };
    };
  
  # 14
  toggleterm = {
    enable = true;
  };
  
  # 15
  treesitter = {
      enable = true;
      nixvimInjections = true;
      folding = true;
      settings = {
        indent.enable = true;
        highlight.enable = true;
        # ensure_installed = "all";
        auto_install = true;
      };
    };
  treesitter-refactor = {
      enable = true;
      highlightDefinitions = {
        enable = true;
        # Set to false if you have an `updatetime` of ~100.
        clearOnCursorMove = false;
      };
    };
  hmts.enable = true;
  
  # 16
  treesitter-context = {
    enable = true;
    settings = { max_lines = 4; };
  };
  
  # 17
  web-devicons = {
      enable = true;
    };
   };       
  };
}

