{ config, pkgs, lib, inputs, pkgsStable, ... }:

{

    environment.systemPackages =
        (with pkgs; [
          bibata-cursors
          brightnessctl
          cliphist
          foot
          fuzzel
          geany
          mako
          mint-y-icons
          nemo
          networkmanagerapplet
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
