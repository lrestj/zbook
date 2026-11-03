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
          hash = "sha256-j6wTbYth2m+rQ2zw/tmkpKT1d2JCV8rcbkuFCvg+HcU=";
        };
      });
    })
  ];

  environment.systemPackages = [ pkgs.vim-full ];
}
