{pkgs, ...}: {
 programs.nixvim = {
  plugins = {
    conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          terraform = ["tofu_fmt"];
          tf = ["tofu_fmt"];
        };
      };
    };

  };

  extraPlugins = [
    # Set ansible.yaml files
    (pkgs.vimUtils.buildVimPlugin {
      name = "nvim-ansible";
      src = pkgs.fetchFromGitHub {
        owner = "mfussenegger";
        repo = "nvim-ansible";
        rev = "9c3b4a771b8c8d7b4f2171466464d978cb3846f7";
        hash = "sha256-N1yOL77WpP66A2zrKxi7IOO5uRzAaeGa0Y/yWaIFiws=";
      };
    })
  ];
 };
}
