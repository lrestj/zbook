{ config, pkgs, lib, inputs, pkgsStable, ... }:

{

    environment.systemPackages =
        (with pkgs; [
          bibata-cursors
          brightnessctl
          cliphist
          evince
          fuzzel
          geany
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
          udiskie
          wl-clipboard
          wlsunset
          swaybg
          swaylock
          swayidle
          sway-contrib.grimshot
          wlprop
          wl-color-picker
          waybar
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
      };
  };

  systemd = {
      user.services.polkit-gnome-authentication-agent-1 = {
          description = "polkit-gnome-authentication-agent-1";
          wantedBy = [ "graphical-session.target" ];
          wants = [ "graphical-session.target" ];
          after = [ "graphical-session.target" ];
          serviceConfig = {
              Type = "simple";
              ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
              Restart = "on-failure";
              RestartSec = 1;
              TimeoutStopSec = 10;
          };
      };    
  };

}

#####  END OF FILE  #####
