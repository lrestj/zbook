{ config, pkgs, lib, inputs, pkgsStable, ... }:

{

  _module.args.pkgsStable = import inputs.nixpkgs-stable {
      inherit (pkgs.stdenv.hostPlatform) system;
      inherit (config.nixpkgs) config;
  };
  
    environment.systemPackages =
        (with pkgs; [
          foot
          mako
          fuzzel
          pamixer
          pavucontrol
          resvg
          brightnessctl
          udiskie
          papirus-icon-theme
          geany
          wl-clipboard
          cliphist
       ])

        ++

        (with pkgsStable; [
            # galculator
        ]);
  
  programs = {
      sway = {
              enable = true;
              wrapperFeatures.gtk = true;
              xwayland.enable = true;
              extraPackages = with pkgs; [
                  grim
                  swaybg
                  swaylock
                  swayidle
                  sway-contrib.grimshot
                  wlprop
                  wl-color-picker
                  waybar
                  waypaper
              ];
      };
  };
}

#####  END OF FILE  #####
