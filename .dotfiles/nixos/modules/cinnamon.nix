{ config, pkgs, lib, inputs, ... }:

{
   environment.cinnamon.excludePackages = with pkgs; [
       timeshift
       blueman
       warpinator
       thunderbolt
       pix
   ];

   services = {
       libinput.enable = true;
       displayManager = {
           defaultSession = "cinnamon";
           autoLogin = {
               enable = true;
               user = "libor";
           };    
       };     
       xserver = {
           enable = true;
           desktopManager.cinnamon.enable = true;
           displayManager = {
             lightdm.enable = true;
           };   
       };
   };
 }

#####  END OF FILE  #####
