{config, pkgs, nixvim, ...}:
{
 programs.nixvim = {
   plugins = {
      
     conform-nvim = {
        enable = true;
        settings = { 
        formatters_by_ft = {
        # golang  
        go = [ "golines" ];
        # javascript
        javascript = ["prettier"];
        typescript = ["prettier"];
        javascriptreact = ["prettier"];
        typescriptreact = ["prettier"];
        # iac
        terraform = ["tofu_fmt"];
        tf = ["tofu_fmt"];
        # python
        formatters_by_ft.python = [ "black" ];
           };
        };
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
  
  # python
  dap-python.enable = true; 
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
  
    extraConfigLua = ''
    require("dap").configurations.javascript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "''${file}",
        cwd = "''${workspaceFolder}",
      },
    }
  '';
  
 };
}
