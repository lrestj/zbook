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
          hash = "sha256-dIY8tNb2kx/2UtB4pj6a1Uh5+YzYt+MVZ8j7E4PelQk=";
        };
      });
    })
  ];

  environment.systemPackages = [ pkgs.vim-full ];
}
