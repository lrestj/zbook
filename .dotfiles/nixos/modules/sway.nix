{ config, pkgs, lib, inputs, pkgsStable, ... }:

{
    programs = {
        sway = {
                enable = true;
                wrapperFeatures.gtk = true;
                xwayland.enable = true;
        };
    };

    xdg.portal = {
        wlr.enable = true;
        config.sway = {
           default = [ "wlr" "gtk" ]; 
        };
    };

    environment.systemPackages =
        (with pkgs; [
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
          waybar
          xed-editor
       ])

        ++

        (with pkgsStable; [
            # galculator
        ]);
  
}

#####  END OF FILE  #####
