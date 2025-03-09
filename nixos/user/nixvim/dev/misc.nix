{pkgs, nixvim, ...}:
{

  programs.nixvim.plugins = {
    fidget = {
      enable = true;
      settings.progress = {
        suppress_on_insert = true;
        ignore_done_already = true;
        poll_rate = 1;
       };
   };

   lazy = {
     enable = true;
    };

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
  };
}
