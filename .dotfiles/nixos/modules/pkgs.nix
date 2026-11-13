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
            brave-origin
            btop
            fastfetch
            file-roller
            fish
            font-manager
            firefox
            fzf
            galculator
            gcolor3
            gnome-characters
            kdePackages.qt6ct
            kdePackages.qtsvg
            libnotify
            libreoffice
            pdfarranger
            rclone
            ripgrep
            simple-scan
            system-config-printer
            wmctrl
            xdotool
            xournalpp
            yazi
            ytdownloader
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
