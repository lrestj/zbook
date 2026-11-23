{ config, pkgs, lib, inputs, pkgsStable, ... }:

{

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
          xed-editor
       ])

        ++

        (with pkgsStable; [
            # galculator
        ]);
  
  programs.niri.enable = true;

  systemd.user.services = {
      # waybar = { 
      #     description = "Waybar"; 
      #     wantedBy = [ "niri.service" ]; 
      #     wants = [ "graphical-session.target" ]; 
      #     after = [ "niri.service" ]; 
      #     serviceConfig = { 
      #         Type = "simple"; 
      #         ExecStart = "${pkgs.waybar}/bin/waybar"; 
      #         Restart = "on-failure"; 
      #         RestartSec = 1; 
      #         TimeoutStopSec = 10;
      #    };     
      # }; 
      polkit-mate-authentication-agent-1 = { 
          description = "polkit-mate-authentication-agent-1"; 
          wantedBy = [ "graphical-session.target" ]; 
          wants = [ "graphical-session.target" ]; 
          after = [ "graphical-session.target" ]; 
          serviceConfig = { 
              Type = "simple"; 
              ExecStart = "${pkgs.mate-polkit}/libexec/polkit-mate-authentication-agent-1"; 
              Restart = "on-failure"; 
              RestartSec = 1; 
              TimeoutStopSec = 10;
         };     
      }; 
  };

}

#####  END OF FILE  #####
