{ config, pkgs, lib, inputs, ... }:

{
  hardware = {
      nvidia = {
          branch = legacy_580;
          modesetting.enable = true;
          powerManagement = {
              # enable = true;
              finegrained = true;
          };
          nvidiaSettings = true;
          # package = config.boot.kernelPackages.nvidiaPackages.stable;
          # package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
          #     version = "580.142"; # Replace with the exact version string needed
          #     sha256_64bit = "sha256-IJFfzz/+icNVDPk7YKBKKFRTFQ2S4kaOGRGkNiBEdWM="; # Needed
          #     sha256_aarch64 = "sha256-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx="; # Needed
          #     openSha256 = "sha256-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx="; # Needed
          #     settingsSha256 = "sha256-QMx4rUPEGp/8Mc+Bd8UmIet/Qr0GY8bnT/oDN8GAoEI="; # Needed
          #     persistencedSha256 = "sha256-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx="; # Needed
          # };
          open = false;
          prime = {
              intelBusId = "PCI:0:2:0";
              nvidiaBusId = "PCI:1:0:0";
              offload = {
                  enable = true;
                  enableOffloadCmd = true;
              };
          };
      };
  };

  boot ={
       kernelParams = [ "nvidia-drm.fbdev=1" ];
      # initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_drm" ];
      
  };

  services = {
      xserver = {
          enable = true;
          videoDrivers = [ "nvidia" ];
      };
  };

}

#####  END OF FILE  #####
