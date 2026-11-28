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
          hash = "sha256-DGikS2gkf5g6zMDk7UKUNPJeY2GlQEF2qNehquZvhfo=";
        };
      });
    })
  ];

  environment.systemPackages = [ pkgs.vim-full ];
}
