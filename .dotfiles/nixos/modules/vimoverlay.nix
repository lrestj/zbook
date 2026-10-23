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
          hash = "sha256-WdFA51aTP6wv+aAlCCONJRxGEpD+n7ZTDes7k04f1fo= ";
        };
      });
    })
  ];

  environment.systemPackages = [ pkgs.vim-full ];
}
