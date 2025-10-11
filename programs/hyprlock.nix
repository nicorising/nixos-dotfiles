{
  programs.hyprlock = {
    enable = true;

    settings = {
      auth.fingerprint = {
        enabled = true;
      };

      background = {
        path = "$HOME/.cache/hyprlock-wallpaper";
        blur_passes = 1;
        contrast = 1;
        vibrancy = 0.2;
        vibrancy_darkness = 0.2;
      };

      input-field = [
        {
          size = "400, 60";
          outline_thickness = 2;
          dots_size = 0.2;
          dots_spacing = 0.35;
          dots_center = true;
          outer_color = "rgb(40, 40, 40)";
          inner_color = "rgba(40, 40, 40, 0.5)";
          font_color = "rgb(235, 219, 178)";
          fade_on_empty = false;
          rounding = -1;
          check_color = "rgb(152, 151, 26)";
          fail_color = "rgb(204, 36, 29)";
          fail_transition = 300;
          placeholder_text = "";
          hide_input = false;
          position = "0, -200";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        {
          text = ''cmd[update:1000] echo "$(date +"%-I:%M")"'';
          color = "rgb(235, 219, 178)";
          font_size = 128;
          font_family = "NotoSansM NFM Cond ExtBd";
          position = "0, 200";
          halign = "center";
          valign = "center";
        }
        {
          text = ''cmd[update:1000] echo "$(date +"%A, %B %d")"'';
          color = "rgb(235, 219, 178)";
          font_size = 24;
          font_family = "NotoSansM NFM";
          position = "0, 300";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
