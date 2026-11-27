{ config, pkgs, lib, inputs, pkgsStable, ... }:

{

    programs.niri.enable = true;

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
          python3
          swaybg
          swaylock
          swayidle
          system-config-printer
          xed-editor
          xwayland-satellite
       ])

        ++

        (with pkgsStable; [
            # galculator
        ]);


systemd.user.services = {
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
