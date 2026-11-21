{ pkgs,inputs, ...}:

  let
    tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
    hyprland-session = "${pkgs.hyprland}/bin/Hyprland";
    sway-session = "sway-run";
    niri-session = "niri-session";
  in
 
{

  services.greetd = {
      enable = true;
      settings = {
          initial_session = {
              command = "${niri-session}";
              user = "mirek";
          };
          default_session = {
              command = "${tuigreet} --greeting 'Vítejte v NixOS!' --asterisks --time --time-format '%A, %d. %B %Y • %H:%M:%S'  --remember --remember-session --sessions ${niri-session}";
              user = "greeter";
          };
      };
  };

  systemd.services.greetd.serviceConfig = {
      Type = "idle";
      StandardInput = "tty";
      StandardOutput = "tty";
      StandardError = "journal";
      TTYReset = true;
      TTYVHangup = true;
      TTYVTDisallocate = true;
  };

}
