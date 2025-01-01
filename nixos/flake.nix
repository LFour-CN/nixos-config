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
          ./system/amdgpu.nix
          ./system/bootloader.nix
          ./system/bluetooth.nix
          ./system/configuration.nix
          ./system/desktop.nix
          ./system/display-manager.nix
          ./system/flakeenable.nix
          ./system/fonts.nix
          ./system/games.nix
          ./system/hardware-configuration.nix
          ./system/layout.nix
          ./system/llm.nix
          ./system/lsp.nix
          ./system/networks.nix
          ./system/nvidiagpu.nix
          ./system/nix-collect-garbage.nix
          ./system/nix-dev.nix
          ./system/neovim.nix
          ./system/openssh.nix
          ./system/powermanager.nix
          ./system/secure-firewall.nix
          ./system/systempkgs.nix
          ./system/systemzsh.nix
          ./system/timezone.nix
          ./system/user.nix
          ./config/nixvim/start.nix
          ./system/video-music.nix
          ./system/virtualisation.nix
       ];
    };
  };
 }
