{
  description = "NixOS System Configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
      };

    #vscodium-server.url = "github:unicap/nixos-vscodium-server";

 };

  outputs =
  {  self, nixpkgs, home-manager, nixvim, flake-parts, neovim-nightly-overlay, auto-cpufreq, ... }@inputs:
    {
     nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [

          nixvim.nixosModules.nixvim

          #nixvim.homeManagerModules.nixvim

          auto-cpufreq.nixosModules.default

          #vscodium-server.nixosModules.default

          home-manager.nixosModules.home-manager
          {
              home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
                #sharedModules = [ nixvim.homeManagerModules.nixvim ];
                users.nixos = import ./home.nix;
          };
     }

          ###### Hardware Configuration ###########

          ./system/hardware/amdgpu.nix
          ./system/hardware/audio.nix
          ./system/hardware/bluetooth.nix
          ./system/hardware/camera.nix
          ./system/hardware/hardware-configuration.nix
          ./system/hardware/nvidia.nix

          ################################
          ###### System Configuration #############

          ./system/configuration/bootloader.nix
          ./system/configuration/desktop.nix
          ./system/configuration/layout.nix
          ./system/configuration/misc.nix
          ./system/configuration/systempkgs.nix
          ./system/configuration/user.nix

          ################################
          ###### System Programs ###############

          ./system/programs/environment-variables.nix
          ./system/programs/lsp.nix
          ./system/programs/networks.nix
          ./system/programs/nixvim/nixvim.nix
          ./system/programs/openssh.nix
          ./system/programs/powermanager.nix
          ./system/programs/programs.nix
          ./system/programs/secure.nix
          ./system/programs/services.nix
          ./system/programs/virtualisation.nix
          ./system/programs/nix-security-box/nix-security-box.nix

          ################################
       ];
    };
  };
}
