{pkgs, ...}:
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
          nixd.enable = true;
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
    };
  };
}
