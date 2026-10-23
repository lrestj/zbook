{ config, pkgs, lib, inputs, pkgsStable, ... }:

{

  imports = [ 
      ./vimoverlay.nix
  ]; 
  
  fonts.packages = with pkgs; [
      font-awesome
      intel-one-mono
      jetbrains-mono
      corefonts vista-fonts
      noto-fonts
      nerd-fonts.hack
      nerd-fonts.symbols-only
  ];
  
  _module.args.pkgsStable = import inputs.nixpkgs-stable {
      inherit (pkgs.stdenv.hostPlatform) system;
      inherit (config.nixpkgs) config;
    };
  
    environment.systemPackages =
        (with pkgs; [
            baobab
            bemoji
            bibata-cursors
            brave
            brightnessctl
            btop
            cliphist
            dconf-editor
            efibootmgr
            evince
            exfatprogs
            fastfetch
            fcft
            file-roller
            fish
            font-manager
            foot
            fuzzel
            fzf
            galculator
            gcolor3
            geany
            gnome-characters
            gparted
            kitty
            mesa-demos
            hunspellDicts.cs_CZ
            hunspellDicts.en_US
            jq
            kdePackages.qt6ct
            kdePackages.qtsvg
            kdePackages.qtwayland
            killall
            libnotify
            libreoffice
            libva-utils
            lshw
            mako
            mpv
            nemo
            networkmanagerapplet
            nwg-look
            pamixer
            papirus-icon-theme
            pavucontrol
            pdfarranger
            polkit_gnome
            python314Packages.beautifulsoup4
            python3Minimal
            rclone
            reaper  
            reaper-reapack-extension
            reaper-sws-extension
            ripgrep
            rofi
            simple-scan
            slurp
            udiskie
            udisks
            unzip
            vlc
            swaybg
            swaylock
            swayidle
            qutebrowser zenity
            waybar
            waypaper
            wget
            wl-clipboard
            wlsunset
            xdg-user-dirs
            xdg-utils
            xnviewmp
            xeyes
            xournalpp
            xfce4-clipman-plugin
            xwayland-satellite
            yazi
            ytdownloader
            zip
            p7zip
            (pkgs.writeScriptBin "sct" ''
                #!/bin/sh
                killall wlsunset &> /dev/null;
                if [ $# -eq 1 ]; then
                    temphigh=$(( $1 + 1 ))
                    templow=$1
                    wlsunset -t $templow -T $temphigh &> /dev/null &
                else
                    killall wlsunset &> /dev/null;
                fi
            '')
            ])

        ++

        (with pkgsStable; [
            # galculator
        ]);
  
  programs = {
      niri.enable = true;
      dconf.enable = true;  
      nh = {
          enable = true;
          clean.enable = true;
          clean.extraArgs = "--keep-since 7d --keep 3";
          flake = "$HOME/.dotfiles/nixos/";
      };

      git = {
          enable = true;
          config = {
              safe.directory = "$HOME/.dotfiles";
              init = {
                  defaultBranch = "main";
                  userName  = "libor";
                  userEmail = "rest@seznam.cz";
              };
          };
      };
  };

}

#####  END OF FILE  #####
