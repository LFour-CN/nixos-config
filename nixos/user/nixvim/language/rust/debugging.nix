{ pkgs, ... }: {
 programs.nixvim = {
  plugins = {
    dap.enable = true;
    dap-ui.enable = true;
    dap-virtual-text.enable = true;

    dap.adapters = {
      executables = { lldb = { command = "${pkgs.lldb_19}/bin/lldb-dap"; }; };
    };
  };
 };
}
