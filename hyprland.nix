{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      input = {
        kb_layout = "us";
        kb_model = "pc104";
        follow_mouse = 2;
        touchpad.natural_scroll = true;
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

        "super shift, 1, movetoworkspace, 1"
        "super shift, 2, movetoworkspace, 2"
        "super shift, 3, movetoworkspace, 3"
        "super shift, 4, movetoworkspace, 4"
        "super shift, 5, movetoworkspace, 5"
        "super shift, 6, movetoworkspace, 6"
        "super shift, 7, movetoworkspace, 7"
        "super shift, 8, movetoworkspace, 8"
        "super shift, 9, movetoworkspace, 9"
        "super shift, 0, movetoworkspace, 10"
      ];

      bindm = [
        "super, mouse:272, movewindow"
        "super, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      exec-once = [
        "waybar"
      ];

      windowrule = "suppressevent maximize, class:.*";
    };
  };
}
