{self, lib, config, pkgs, nixvim, ...}:
{
 programs.nixvim = {
   plugins = {  
     conform-nvim = {      
        enable = true;
        settings = { 
          formatters = {
            # cpp
            #clang-format.command = lib.getExe pkgs.clang-tools.clang-format;
            #cmake-format.command = lib.getExe pkgs.cmake-format;
            # css & html 
            prettierd.command = lib.getExe pkgs.prettierd;
            prettier.command = lib.getExe pkgs.nodePackages.prettier;
            # json
            jq = {
              command = lib.getExe pkgs.jq;
            };
            # lua
            stylua = {
              command = lib.getExe pkgs.stylua;
            };
            # nix
            nixfmt.command = lib.getExe pkgs.nixfmt-rfc-style;
            # shell
            shfmt.command = lib.getExe pkgs.shfmt;
            # yamlls
            yamlfmt.command = lib.getExe pkgs.yamlfmt;
        };
         formatters_by_ft = {
        # cpp
        cpp = [ "clang-format" ];
        cmake = [ "cmake-format" ];
        # css
        css = {
        __unkeyed-1 = "prettierd";
        __unkeyed-2 = "prettier";
        timeout_ms = 2000;
        stop_after_first = true;
        };
        # golang  
        go = [ "golines" ];
        # javascript
        javascript = ["prettier"];
        typescript = ["prettier"];
        javascriptreact = ["prettier"];
        typescriptreact = ["prettier"];
        # json
        json = [ "jq" ];
        # html
        html = {
        __unkeyed-1 = "prettierd";
        __unkeyed-2 = "prettier";
        timeout_ms = 2000;
        stop_after_first = true;
        };
        # lua
        lua = [ "stylua" ];
        # iac
        terraform = ["tofu_fmt"];
        tf = ["tofu_fmt"];
        # yamlls
        yaml = [ "yamlfmt" ];
        # python
        formatters_by_ft.python = [ "black" ];
        # nix
        nix = [ "nixfmt" ];
        # shell
        sh = [ "shfmt" ];
           };
        };
      };
      
    # cpp
    lint = {
      lintersByFt = {
        cpp = [ "clangtidy" ];
        cmake = [ "cmakelint" ];
      };

      linters = {
        clangtidy.cmd = lib.getExe' pkgs.clang-tools "clang-tidy";
        cmakelint.cmd = lib.getExe' pkgs.cmake-format "cmake-lint";
      };
    };

    lsp.servers = {
      cmake.enable = true;
      clangd = {
        enable = true;
        cmd = [
          "clangd"
          "--offset-encoding=utf-16"
          "--header-insertion=iwyu"
          "--background-index"
          "--clang-tidy"
          "--all-scopes-completion"
          "--completion-style=detailed"
          "--function-arg-placeholders"
          "--fallback-style=llvm"
          "-j=6"
        ];
        onAttach.function = ''
          vim.keymap.set('n', 'gh', "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header (C/C++)", buffer = bufnr })

          require("clangd_extensions.inlay_hints").setup_autocmd()
          require("clangd_extensions.inlay_hints").set_inlay_hints()
        '';
        extraOptions = {
          init_options = {
            usePlaceholders = true;
            completeUnimported = true;
            clangdFileStatus = true;
          };
        };
      };
    };

    clangd-extensions = {
      enable = true;
      settings = {
        inlay_hints = {
          inline = false;
        };
        codelens.enable = true;

        ast = {
          roleIcons = {
            type = "";
            declaration = "";
            expression = "";
            specifier = "";
            statement = "";
            templateArgument = "";
          };
          kindIcons = {
            compound = "";
            recovery = "";
            translationUnit = "";
            packExpansion = "";
            templateTypeParm = "";
            templateTemplateParm = "";
            templateParamObject = "";
          };
        };
      };
    };

    dap = {
      adapters.executables.lldb.command = "${pkgs.lldb}/bin/lldb-vscode";

      configurations.cpp = [
        {
          name = "C++";
          type = "lldb";
          request = "launch";
          cwd = "\${workspaceFolder}";
          program.__raw = ''
            function()
              return vim.fn.input('Executable path: ', vim.fn.getcwd() .. '/', 'file')
            end
          '';
        }
      ];
    };

    # css
    lsp.servers = {
      cssls = {
        enable = true;
        cmd = [
          "${pkgs.vscode-langservers-extracted}/bin/vscode-css-language-server"
          "--stdio"
        ];
      };
      tailwindcss = {
        enable = true;
        cmd = [
          (lib.getExe pkgs.tailwindcss-language-server)
          "--stdio"
        ];
      };
    };
    

    lint = {
      lintersByFt.lua = [ "luacheck" ];
      linters.luacheck.cmd = lib.getExe pkgs.lua54Packages.luacheck;
    };
    lsp.servers.lua_ls.enable = true;
    
    # html
    lsp = {
      servers = {
        html = {
          enable = true;
          cmd = [
            "${pkgs.vscode-langservers-extracted}/bin/vscode-html-language-server"
            "--stdio"
          ];
        };
      };

      enabledServers = [
        {
          name = "emmet_language_server";
          extraOptions = {
            cmd = [
              (lib.getExe pkgs.emmet-language-server)
              "--stdio"
            ];
            filetypes = [ "html" ];
          };
        }
      ];
    };
    
    # golang  
    lsp.servers.gopls.enable = true;
    none-ls.sources.formatting.golines.enable = true;
    dap-go = {
       enable = true;
       settings = {
        delve.path = "${pkgs.delve}/bin/dlv";
      };
    };
  
  # javascript
  dap = {
     enable = true;
     adapters.servers = {
        "pwa-node" = {
          host = "localhost";
          port = 8123;
          executable = {
             command = "${pkgs.vscode-js-debug}/bin/js-debug";
          };
        };
      };
    };

    # json
    lint = {
      lintersByFt = {
        json = [ "jsonlint" ];
      };

      linters = {
        jsonlint = {
          cmd = lib.getExe pkgs.nodePackages_latest.jsonlint;
        };
      };
    };
    lsp.servers.jsonls = {
      enable = true;
    };
  
  # nix
    nix.enable = true;
    hmts.enable = true;
    nix-develop.enable = true;  
    lint = {
      lintersByFt = {
        nix = [ "statix" ];
      };

      linters = {
        statix.cmd = lib.getExe pkgs.statix;
      };
    };

    lsp.servers.nixd = {
      enable = true;
     # settings =
       # let
       #   flake = ''(builtins.getFlake "${self}")'';
       #   system = ''''${builtins.currentSystem}'';
      #  in
      #  {
       #   formatting = {
       #     command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
       #   };
       #   nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";
       #   options = {
       #     nixvim.expr = ''${flake}.packages.${system}.nvim.options'';
       #   };
      #  };
    };
    
   #yamlls
   lsp.servers.yamlls = {
      enable = true;
      extraOptions = {
        capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false;
              lineFoldingOnly = true;
            };
          };
        };
      };
    };
    
  # python
  lsp.servers.pylsp = {
     enable = true;
     settings.plugins = {
        black.enabled = true;
        flake8.enabled = true;
        isort.enabled = true;
        jedi.enabled = true;
        mccabe.enabled = true;
        pycodestyle.enabled = true;
        pydocstyle.enabled = true;
        pyflakes.enabled = true;
        pylint.enabled = true;
        rope.enabled = true;
        yapf.enabled = true;
     };
  };
   none-ls.sources.formatting.black.enable = true;
  };
  
  #  extraConfigLua = ''
   # require("dap").configurations.javascript = {
   #   {
   #     type = "pwa-node",
   #     request = "launch",
  #      name = "Launch file",
 #       program = "''${file}",
  #      cwd = "''${workspaceFolder}",
  #    },
 #   }
  #'';
  
 };
}
