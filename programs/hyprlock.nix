{
  programs.hyprlock = {
    enable = true;

    settings = {
      auth.fingerprint.enabled = true;

      background = {
        path = "$HOME/.cache/hyprlock-wallpaper";
        blur_passes = 1;
        contrast = 1;
        vibrancy = 0.2;
        vibrancy_darkness = 0.2;
      };

      input-field = [
        {
          position = "0, -200";
          size = "400, 60";
          outline_thickness = 2;
          placeholder_text = "";
          dots_size = 0.2;
          dots_spacing = 0.35;
          dots_center = true;
          fade_on_empty = false;
          outer_color = "rgb(40, 40, 40)";
          inner_color = "rgba(40, 40, 40, 0.5)";
          font_color = "rgb(235, 219, 178)";
          check_color = "rgb(152, 151, 26)";
          fail_color = "rgb(204, 36, 29)";
        }
      ];

      label = [
        {
          position = "0, 200";
          text = ''cmd[update:1000] echo "$(date +"%-I:%M")"'';
          font_family = "NotoSans NFP Cond ExtBd";
          font_size = 128;
          color = "rgb(235, 219, 178)";
        }
        {
          position = "0, 300";
          text = ''cmd[update:1000] echo "$(date +"%A, %B %d")"'';
          font_family = "NotoSans NFP";
          font_size = 24;
          color = "rgb(235, 219, 178)";
        }
      ];
    };
  };
}
