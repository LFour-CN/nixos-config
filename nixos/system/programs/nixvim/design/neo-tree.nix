 {
 programs.nixvim = {
  plugins.neo-tree = {
      enable = true;
      enableDiagnostics = true;
      enableModifiedMarkers = true;
      enableRefreshOnWrite = true;
      addBlankLineAtTop = true;
      autoCleanAfterSessionRestore = true;
      closeIfLastWindow = true;
      extraOptions = {};
  };
 };
}
