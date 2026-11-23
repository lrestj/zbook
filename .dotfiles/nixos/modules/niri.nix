{ config, pkgs, lib, inputs, pkgsStable, ... }:

{

    programs.niri.enable = true;

    environment.systemPackages =
        (with pkgs; [
          inputs.oniri.packages.${pkgs.stdenv.hostPlatform.system}.default
          bibata-cursors
          brightnessctl
          cliphist
          evince
          gnome-characters
          gnome-themes-extra
          gparted
          hyprpicker
          jq
          mako
          mate-polkit
          mpv
          nemo
          networkmanagerapplet
          nwg-look
          pamixer
          papirus-icon-theme
          pavucontrol
          resvg
          ristretto
          rofi
          udiskie
          wl-clipboard
          wlsunset
          swaybg
          swaylock
          swayidle
          sway-contrib.grimshot
          system-config-printer
          xed-editor
       ])

        ++

        (with pkgsStable; [
            # galculator
        ]);
  
}

#####  END OF FILE  #####
