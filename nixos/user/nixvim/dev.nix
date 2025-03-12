{config, pkgs, lib, nixvim, inputs, ...}:
{
  programs.nixvim = {
  
  #copilot-chat = {
   #   inherit (config.plugins.copilot-lua) enable;
   # };
    
    opts.completeopt = ["menu" "menuone" "noselect"];
    highlight.Todo = {
      fg = "Blue";
      bg = "Yellow";
    };
    match.TODO = "TODO";
    
    autoCmd = [
    # Vertically center document when entering insert mode
    {
      event = "InsertEnter";
      command = "norm zz";
    }

    # Open help in a vertical split
    {
      event = "FileType";
      pattern = "help";
      command = "wincmd L";
    }

    # Enable spellcheck for some filetypes
    {
      event = "FileType";
      pattern = [
        "markdown"
      ];
      command = "setlocal spell spelllang=en";
    }

  ];
    
  plugins = {
  
  # Codium AI chat
  codeium-nvim = {
     enable = false;
     settings = {
        enable_chat = true;
        tools = {
          curl = lib.getExe pkgs.curl;
          gzip = lib.getExe pkgs.gzip;
          uname = lib.getExe' pkgs.coreutils "uname";
          uuidgen = lib.getExe' pkgs.util-linux "uuidgen";
        };
      };
    };
  
  # copilot AI
  copilot-lua = {
     enable = true;
    # settings = {
     #   panel.enabled = !config.plugins.blink-cmp-copilot.enable;
     #   suggestion.enabled = !config.plugins.blink-cmp-copilot.enable;
     # };
   };
   
  # 1
  comment = {
    enable = true;
     };
     
  # 2   
  #luasnip.enable = true;
  #cmp-ai.enable = true;
  #cmp-tabnine.enable = true;
  cmp-calc.enable = true;
  cmp-emoji.enable = true;
  cmp-zsh.enable = true;
  cmp-omni.enable = true;
  cmp-dap.enable = true;
  cmp-nvim-lsp.enable = true;
  cmp-nvim-lsp-document-symbol.enable = true;
  cmp-nvim-lsp-signature-help.enable = true;
  cmp-dictionary.enable = true;
  cmp-nvim-lua.enable = true;
  cmp_luasnip.enable = true;
  cmp-path.enable = true;
  cmp-buffer.enable = true;
  lspkind = {
     enable = true;
     cmp = {
        enable = true;
        menu = {
            nvim_lsp = "[LSP]";
            nvim_lua = "[api]";
            path = "[path]";
            luasnip = "[snip]";
            buffer = "[buffer]";
            neorg = "[neorg]";
          };
        };
      };
      cmp = {
        enable = true;
        autoEnableSources = true;

        settings = {
          snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

          mapping = {
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };
          sources = [
            {name = "path";}
            {name = "nvim_lsp";}
            {name = "luasnip";}
            {
              name = "buffer";
              # Words from other open buffers can also be suggested.
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            }
            {name = "neorg";}
          ];
        };
      };
     
  # 3   
  dap-lldb.enable = true;
  dap.enable = true;
  dap-ui = {
        enable = true;
        settings = {
          floating.mappings = {close = ["<ESC>" "q"];};
          ayouts = [
          {
            elements = [
              {
                id = "scopes";
                size = 0.25;
              }
              {
                id = "breakpoints";
                size = 0.25;
              }
              {
                id = "stacks";
                size = 0.25;
              }
              {
                id = "watches";
                size = 0.25;
              }
            ];
            position = "left";
            size = 40;
          }
          {
            elements = [
              {
                id = "repl";
                size = 0.5;
              }
              {
                id = "console";
                size = 0;
              }
            ];
            position = "bottom";
            size = 10;
            }
          ];
       };
    };
  dap-virtual-text = {
      enable = true;
  };
  dap-python.enable = true;
  dap-go = {
     enable = true;
     settings = {
       delve.path = "${pkgs.delve}/bin/dlv";
      };
   };
  dap.signs = {
        dapBreakpoint = {
          text = " ";
          texthl = "DiagnosticInfo";
        };
        dapBreakpointCondition = {
          text = " ";
          texthl = "DiagnosticInfo";
        };
        dapBreakpointRejected = {
          text = " ";
          texthl = "DiagnosticError";
        };
        dapLogPoint = {
          text = " ";
          texthl = "DiagnosticInfo";
        };
        dapStopped = {
          text = "󰁕 ";
          texthl = "DiagnosticWarn";
          linehl = "DapStoppedLine";
          numhl = "DapStoppedLine";
        };
   };
  
  # 4   
  friendly-snippets = {
    enable = true;
   };   
     
  # 5
  gitblame = {
    enable = true;
  };   
     
  # 6
  harpoon = {
      enable = true;
      keymapsSilent = true;
      keymaps = {
        addFile = "<leader>a";
        toggleQuickMenu = "<C-e>";
        navFile = {
          "1" = "<C-j>";
          "2" = "<C-k>";
          "3" = "<C-l>";
          "4" = "<C-m>";
        };
      };
    };    
     
  # 7
  nvim-jdtls = {
    enable = true;
    data = ".jdtls/workspace";
    configuration = ".jdtls/config";
    extraOptions = {
      on_attach.__raw = ''
        function(client, bufnr)
          require("jdtls.setup").add_commands()
          -- require("jdtls").setup_dap({ hotcodereplace = "auto" })
          -- require("jdtls.dap").setup_dap_main_class_configs()
        end
      '';
    };
  };   
     
  # 8
  lazygit = {
    enable = true;
  };     
     
  # 9
  lint = {
    enable = true;
    lintersByFt = {
      text = ["vale"];
      markdown = ["vale"];
      dockerfile = ["hadolint"];
      terraform = ["tflint"];
      python = ["pylint"];
   };
 };   
     
  # 10
  lsp = {
    enable = true;
    keymaps = {
        silent = true;
        diagnostic = {
            # Navigate in diagnostics
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };
        lspBuf = {
           gd = "definition";
           gD = "references";
           gt = "type_definition";
           gi = "implementation";
           K = "hover";
           "<F2>" = "rename";
          };
        };
      servers = {
         clangd = {
            enable = true;
            settings = {
              clangd = {
                completion = {
                includeFixIts = true;
              };
                index = {
                threads = 0;
             };
          };
        };
     };
          ansiblels.enable = true;
          bashls.enable = true;
          dockerls.enable = true;
          elixirls.enable = true;
          gleam.enable = true;
          gopls.enable = true;
          golangci_lint_ls.enable = true;
          kotlin_language_server.enable = true;
          nil_ls.enable = true;
          #nixd.enable = true;
          nginx_language_server.enable = true;
          pyright.enable = true;
          pylsp.enable = true;
          prolog_ls = {
            enable = true;
            package = pkgs.swi-prolog;
          };
          ruff.enable = true;
          tflint.enable = true;
          templ.enable = true;
          terraformls.enable = true;
          helm_ls.enable = true;
          html.enable = true;
          htmx.enable = true;
          ts_ls.enable = true;
          biome = {
            enable = true;
            onAttach.function = ''
              client.server_capabilities.documentFormattingProvider = false
            '';
          };
          tailwindcss.enable = true;
          cssls.enable = true;
          astro.enable = true;
          volar.enable = true;
          lua_ls.enable = true;
          omnisharp.enable = true;
          dartls.enable = true;
          java_language_server.enable = true;
        };
      };     
     
  # 11
  luasnip = {
    enable = true;
    # Trigger vscode auto import.
    fromVscode = [{ }];
  };     
     
  # 12
  markdown-preview = {
      enable = true;
      settings = {
        auto_close = 1;
        theme = "dark";
      };
    };     
     
  # 13     
  fidget = {
     enable = true;
     settings.progress = {
        suppress_on_insert = true;
        ignore_done_already = true;
        poll_rate = 1;
      };
   };

  # 14
   lazy = {
     enable = true;
    };

  # 15
  mini = {
      enable = true;
      modules = {
        ai = {
          n_lines = 500;
        };
        surround = {
        };
        statusline = {
          use_icons.__raw = "vim.g.have_nerd_font";
          };
       };
    };   
     
  # 16
  neogen = {
    enable = true;
  };     
     
     
  # 18
  trouble = {
    enable = true;
   };    
 };
   
 # extraConfigLua = ''
 #   local luasnip = require("luasnip")
#
 #   local unlinkgrp = vim.api.nvim_create_augroup(
  #    "UnlinkSnippetOnModeChange",
 #     { clear = true }
 #   )
#
  #  vim.api.nvim_create_autocmd("ModeChanged", {
  #    group = unlinkgrp,
  #    pattern = {"s:n", "i:*"},
  #    desc = "Forget the current snippet when leaving the insert mode",
  #    callback = function(evt)
  #      if
   #       luasnip.session
  #        and luasnip.session.current_nodes[evt.buf]
  #        and not luasnip.session.jump_active
  #      then
   #       luasnip.unlink_current()
   #     end
  #    end,
  #  })
 # '';   
 
 };
}
