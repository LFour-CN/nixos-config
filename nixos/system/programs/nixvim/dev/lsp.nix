{
  programs.nixvim = {
    plugins = {
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
                # 开启更智能的补全
                includeFixIts = true;
              };
                index = {
                # 索引头文件
                threads = 0; # 使用所有可用的线程
             };
          };
        };
     };
         ansiblels.enable = true;
         dockerls.enable = true;
          gopls.enable = true;
          golangci_lint_ls.enable = true;
          lua_ls.enable = true;
          nil_ls.enable = true;
          nginx_language_server.enable = true;
          pyright.enable = true;
          pylsp.enable = true;
          tflint.enable = true;
          templ.enable = true;
          terraformls.enable = true;
          helm_ls.enable = true;
          html.enable = true;
          htmx.enable = true;
          tailwindcss.enable = true;
        };
      };
    };
  };
}

