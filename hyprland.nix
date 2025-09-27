{
  # Copy over wallpapers
  home.file.".local/share/wallpapers" = {
    source = ./wallpapers;
    recursive = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      exec-once = [
        "waybar"
      ];

      general = {
        border_size = 1;
        gaps_in = 8;
        gaps_out = 16;
        resize_on_border = true;
      };

      decoration = {
        rounding = 4;
        inactive_opacity = 0.9;
      };

      input = {
        kb_layout = "us";
        kb_model = "pc104";
        repeat_rate = 35;
        repeat_delay = 200;

        follow_mouse = 2;
      };

      gestures = {
        workspace_swipe_invert = false;
        workspace_swipe_forever = true; # Allow swiping multiple workspaces at once
        workspace_swipe_min_speed_to_force = 1;
        workspace_swipe_cancel_ratio = 0.02;
      };

      bind = [
        "super, return, exec, kitty"
        "super, r, exec, ranger"
        "super, w, exec, librewolf"
        "super, space, exec, wofi --show drun"
        "super, q, killactive"
        "super shift, q, exit"
        "super, f, togglefloating"
        "super, p, pseudo"

        "super, 1, workspace, 1"
        "super, 2, workspace, 2"
        "super, 3, workspace, 3"
        "super, 4, workspace, 4"
        "super, 5, workspace, 5"
        "super, 6, workspace, 6"
        "super, 7, workspace, 7"
        "super, 8, workspace, 8"
        "super, 9, workspace, 9"
        "super, 0, workspace, 10"

        "super shift, 1, movetoworkspacesilent, 1"
        "super shift, 2, movetoworkspacesilent, 2"
        "super shift, 3, movetoworkspacesilent, 3"
        "super shift, 4, movetoworkspacesilent, 4"
        "super shift, 5, movetoworkspacesilent, 5"
        "super shift, 6, movetoworkspacesilent, 6"
        "super shift, 7, movetoworkspacesilent, 7"
        "super shift, 8, movetoworkspacesilent, 8"
        "super shift, 9, movetoworkspacesilent, 9"
        "super shift, 0, movetoworkspacesilent, 10"

        "super, 1, workspace, 1"
      ];

      bindm = [
        "super, mouse:272, movewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      gesture = [
        "3, horizontal, workspace"
      ];
    };
  };
}
