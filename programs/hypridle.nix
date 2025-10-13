{
  services.hypridle = {
    enable = true;

    settings = {
      general.lock_cmd = "pidof hyprlock || hyprlock";

      listener = [
        {
          timeout = 10;
          on-timeout = "brightnessctl -s set 0";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 20;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 30;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
