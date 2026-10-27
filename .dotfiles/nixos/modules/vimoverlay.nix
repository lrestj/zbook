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
          hash = "sha256-iUnLSFptXdJhhZwKfQKcRzA+SjrhzLPYNLDSHM88r3Y=";
        };
      });
    })
  ];

  environment.systemPackages = [ pkgs.vim-full ];
}
