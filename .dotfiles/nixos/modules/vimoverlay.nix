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
          hash = "sha256-IYVh12jwPHZG1BkNz3b18+Q6WkNwuJtvJfaiEIPBH3w=";
        };
      });
    })
  ];

  environment.systemPackages = [ pkgs.vim-full ];
}
