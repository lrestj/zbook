{ config, pkgs, lib, inputs, pkgsStable, ... }:

{

  imports = [ 
      ./vimoverlay.nix
  ]; 
  
  fonts.packages = with pkgs; [
      font-awesome
      jetbrains-mono
      corefonts vista-fonts
      noto-fonts
      nerd-fonts.symbols-only
  ];
  
  _module.args.pkgsStable = import inputs.nixpkgs-stable {
      inherit (pkgs.stdenv.hostPlatform) system;
      inherit (config.nixpkgs) config;
    };
  
    environment.systemPackages =
        (with pkgs; [
            baobab
            bibata-cursors
            brave
            btop
            evince
            fastfetch
            fcft
            file-roller
            fish
            font-manager
            fzf
            gcolor3
            gnome-characters
            kitty
            kdePackages.qt6ct
            kdePackages.qtsvg
            killall
            libnotify
            libreoffice
            pdfarranger
            rclone
            ripgrep
            rofi
            simple-scan
            vlc
            xournalpp
            xfce4-clipman-plugin
            yazi
            ytdownloader
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
