{ config, pkgs, lib, inputs, ... }:

{
   # Povolení X11 windowing systému
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
