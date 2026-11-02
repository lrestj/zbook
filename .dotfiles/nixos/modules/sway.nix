{ config, pkgs, lib, inputs, pkgsStable, ... }:

{

  _module.args.pkgsStable = import inputs.nixpkgs-stable {
      inherit (pkgs.stdenv.hostPlatform) system;
      inherit (config.nixpkgs) config;
  };
  
    environment.systemPackages =
        (with pkgs; [
          brightnessctl
          cliphist
          foot
          fuzzel
          geany
          mako
          nwg-look
          pamixer
          papirus-icon-theme
          pavucontrol
          resvg
          udiskie
          wl-clipboard
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
