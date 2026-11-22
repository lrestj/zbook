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
          hash = "sha256-cjowLrdbrG8BwMgtlG6BT/t3D91FAKy0dsw5Uh2Em+U=";
        };
      });
    })
  ];

  environment.systemPackages = [ pkgs.vim-full ];
}
