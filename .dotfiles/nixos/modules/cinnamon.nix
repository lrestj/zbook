{ config, pkgs, lib, inputs, ... }:

{
   # Povolení X11 windowing systému
   services = {
       xserver = {
           enable = true;
           displayManager.lightdm.enable = true;
           desktopManager.cinnamon.enable = true;
       };
    };
 }
#####  END OF FILE  #####
