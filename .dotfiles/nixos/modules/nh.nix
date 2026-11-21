{ config, pkgs, lib, inputs, ... }:

{
  
  environment.variables = {
      NH_FLAKE = "/home/libor/.dotfiles/nixos/";
      NH_OS_FLAKE = "/home/libor/.dotfiles/nixos/";
      };


  programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/home/libor/.dotfiles/nixos/";
  };

}

#####  END OF FILE  #####
