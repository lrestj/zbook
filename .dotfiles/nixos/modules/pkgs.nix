{ config, pkgs, lib, inputs, pkgsStable, oniri, ... }:

{

  imports = [ 
      ./vimoverlay.nix
  ]; 
  
  fonts.packages = with pkgs; [
      font-awesome
      jetbrains-mono
      corefonts vista-fonts
      noto-fonts
      inter
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
            file
            file-roller
            fish
            font-manager
            foot
            fzf
            galculator
            gcolor3
            libnotify
            libreoffice
            pdfarranger
            rclone
            ripgrep
            simple-scan
            waybar
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
      gdk-pixbuf.modulePackages = [ pkgs.librsvg ];
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
