##### HP Zbook config #####

{ config, pkgs, lib, ... }:

{

  imports =
      [ # Include hardware-configuration.nix
        ./hardware-configuration.nix
        ../../modules/pkgs.nix
        ../../modules/greetd.nix
      ];

  xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
          xdg-desktop-portal-gnome
          xdg-desktop-portal-gtk
      ];
      config.common = {
         default = [ "gtk" ]; 
         "org.freedesktop.impl.portal.FileChooser"= [ "gtk" ];
      };
  };
  documentation.man.cache.enable = false;
  nixpkgs.config.allowUnfree = true;
  environment = {
      localBinInPath = true;
      variables = {
          EDITOR = "vim";
          BROWSER = "brave";
          TERMINAL = "foot";
          kalk = "galculator";
      };
      sessionVariables = {
          NIXOS_OZONE_WL = "1";
      };
  };
  hardware = {
      cpu.intel.updateMicrocode = true;
      graphics = {
          enable = true;
          extraPackages = with pkgs; [
              intel-media-driver # For Broadwell (2014) or newer processors. LIBVA_DRIVER_NAME=iHD
              libvdpau-va-gl
          ];
      }; 
      sane = {
          enable = true; # enables support for SANE scanners
          extraBackends = [ pkgs.hplip ];
      };
  };
  
  nix = {
      settings = {
          experimental-features = [ "nix-command" "flakes" ];
          download-buffer-size = 125829120;
      };
      gc = {
          automatic = false;
          dates = "weekly";
          options = "--delete-older-than 14d";
      };
  };
  
  security = {
      rtkit.enable = true;
      polkit.enable = true;
      polkit.extraConfig = ''
          polkit.addRule(function(action, subject) {
              if ((action.id == "org.freedesktop.udisks2.filesystem-mount-system" ||
                   action.id == "org.freedesktop.udisks2.filesystem-mount") &&
                  subject.isInGroup("wheel")) {
                  return polkit.Result.YES;
              }
          });
      '';
  };

  systemd = {
      sleep.settings.Sleep = {
          AllowHibernation="no";
          AllowHybridSleep="no";
          AllowSuspendThenHibernate="no";
      };
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
  
  users.users.libor = {
      isNormalUser = true;
      description = "libor";
      extraGroups = [ "networkmanager" "video" "wheel" "scanners" "lp" "input" ];
  };

  boot = {
      kernelPackages = pkgs.linuxPackages;
      kernel.sysctl."vm.swappiness" = 10;
      # initrd.kernelModules = [ "i915" ];
      loader = {
          timeout = 2;
          systemd-boot = {
              enable = true;
              configurationLimit = 7;
              extraEntries = {
                  "Void.conf" = ''
                      title Void linux
                      efi /EFI/void_grub/grubx64.efi
                  '';
                  # "Siduction.conf" = ''
                  #     title openSUSE Tumbleweed
                  #     efi /EFI/opensuse/shim.efi
                  # '';
              };
          };
          efi = {
              canTouchEfiVariables = true;
              efiSysMountPoint = "/boot";
          };
      };
  };

  networking = {
      hostName = "nixos";
      networkmanager.enable = true;
      firewall = {
          enable = true;
          #allowedTCPPorts = [ ... ];
          #allowedUDPPorts = [ ... ];
      };
  };

  # Locale + console settings
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-220b.psf.gz";
    packages = with pkgs; [ terminus_font ];
    keyMap = "cz-qwertz";
  };
  time.timeZone = "Europe/Prague";
  i18n.defaultLocale = "cs_CZ.UTF-8";
  i18n.extraLocaleSettings = {
      LC_ADDRESS = "cs_CZ.UTF-8";
      LC_IDENTIFICATION = "cs_CZ.UTF-8";
      LC_MEASUREMENT = "cs_CZ.UTF-8";
      LC_MONETARY = "cs_CZ.UTF-8";
      LC_NAME = "cs_CZ.UTF-8";
      LC_NUMERIC = "cs_CZ.UTF-8";
      LC_PAPER = "cs_CZ.UTF-8";
      LC_TELEPHONE = "cs_CZ.UTF-8";
      LC_TIME = "cs_CZ.UTF-8";
  };

  services = {
      logind.settings.Login = {
          HandlePowerKey="ignore";
      };
      power-profiles-daemon.enable = true;
      envfs.enable = true;
      gvfs.enable = true;
      tumbler.enable = true;
      udisks2.enable = true;
      xserver = {
          # enable = true;
          xkb.layout = "cz";
          videoDrivers = [ "modesetting" ];
      };
      journald.extraConfig = "SystemMaxUse=50M";
      getty.autologinUser = "libor";
      pipewire = {
          enable = true;
          alsa = {
              enable = true;
              support32Bit = true;
              };
          pulse.enable = true;
          jack.enable = true;
          extraConfig.jack = {
              "10-clock-rate" = {
                  "jack.properties" = {
                      "node.latency" = "256/48000";
                      "node.rate" = "1/48000";
                      "node.lock-quantum" = true;
                  };
              };
          };
      };

      # To add the printer run:
      # NIXPKGS_ALLOW_UNFREE=1 nix-shell -p hplipWithPlugin --run 'sudo -E hp-setup'
      printing = {
          enable = true;
          drivers = [ pkgs.hplip ];
      };
      avahi = {
          enable = true;
          nssmdns4 = true;
          openFirewall = true;
      };
      openssh = {
          enable = true;
          settings = {
              PermitRootLogin = "no";
              PasswordAuthentication = false;
          };
      };
  };

  # NFS Synology shares:
  fileSystems."/nfs/FilmyNas" = {
      device = "192.168.77.18:/volume1/Filmy";
      fsType = "nfs";
      options = [ "nfsvers=4" "x-systemd.automount" "noauto" "x-systemd.iddle-timeout=450" ];
  };
  fileSystems."/nfs/Nas" = {
      device = "192.168.77.18:/volume1/Rodinas";
      fsType = "nfs";
      options = [ "nfsvers=4" "x-systemd.automount" "noauto" "x-systemd.iddle-timeout=450" ];
  };
  fileSystems."/nfs/HudbaNas" = {
      device = "192.168.77.18:/volume1/Hudba";
      fsType = "nfs";
      options = [ "nfsvers=4" "x-systemd.automount" "noauto" "x-systemd.iddle-timeout=450"  ];
  };
  
  # Release version of the first install of this system
  system.stateVersion = "25.11";

}

#####  END OF FILE  #####
