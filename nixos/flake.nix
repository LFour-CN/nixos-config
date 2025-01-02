{
  description = "Configurations";

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
    treefmt-nix.url = "github:numtide/treefmt-nix";
    nuschtosSearch = {
      url = "github:NuschtOS/search";
      inputs.nixpkgs.follows = "nixpkgs";
    };
     flake-compat.url = "https://flakehub.com/f/edolstra/flake-compat/1.tar.gz";
     git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs";
      inputs.flake-compat.follows = "flake-compat";
    };
  };

  nixConfig = {
    extra-substituters = [ "https://nix-community.cachix.org" ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    allow-import-from-derivation = false;
  };

  outputs = {  self, nixpkgs, home-manager, nixvim, flake-parts, ... }:
    {
     nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
       system = "x86_64-linux";
          modules = [
          nixvim.nixosModules.nixvim
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nixos = import ./home.nix;
          }
          ###### Hardware Configuration ###########
          
          ./system/hardware/amdgpu.nix
          ./system/hardware/audio.nix
          ./system/hardware/bluetooth.nix
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
          ./system/programs/llm.nix
          ./system/programs/lsp.nix
          ./system/programs/networks.nix
          ./system/programs/openssh.nix
          ./system/programs/powermanager.nix
          ./system/programs/programs.nix
          ./system/programs/secure.nix
          ./system/programs/services.nix
          ./system/programs/virtualisation.nix
          
          ################################
          ###### Neovim For Whole System ##########
          
          ./config/nixvim/start.nix
          
          ################################
       ];
    };
  };
 }
