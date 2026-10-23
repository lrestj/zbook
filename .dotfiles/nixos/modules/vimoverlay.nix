{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      vim-full = prev.vim-full.overrideAttrs (oldAttrs: rec {
        version = "master";
        src = pkgs.fetchFromGitHub {
          owner = "vim";
          repo = "vim";
          rev = "master";
          hash = "sha256-usUC3Be7ASnjwhgin/BSF1IK4oRMHTYPtKTAQN+SzXw=";
        };
      });
    })
  ];

  environment.systemPackages = [ pkgs.vim-full ];
}
