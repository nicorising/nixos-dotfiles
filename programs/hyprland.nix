{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      exec-once = [
        "hyprctl setcursor 'Capitaine Cursors (Gruvbox)' 24"
        "hyprland-wallpapers"
        "systemctl --user start hyprpolkitagent"
        "waybar"
      ];

      general = {
        border_size = 1;
        gaps_in = 8;
        gaps_out = 16;
        resize_on_border = true;
      };

      dwindle = {
        force_split = 2; # Always open windows to the right
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

      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };

      xwayland.force_zero_scaling = true;
      misc.disable_hyprland_logo = true;

      bind = [
        "super, return, exec, kitty"
        "super, r, exec, ranger"
        "super, w, exec, librewolf"
        "super, space, exec, wofi --show drun"
        "super, q, killactive"
        "super, f, togglefloating"
        "super, p, pseudo"
        ", XF86AudioMedia, exec, hyprlock" # The Framework logo key (F12)
        "super control shift, q, exit"

        "super, l, movefocus, r"
        "super, h, movefocus, l"
        "super, j, movefocus, d"
        "super, k, movefocus, u"

        "super shift, l, swapwindow, r"
        "super shift, h, swapwindow, l"
        "super shift, j, swapwindow, d"
        "super shift, k, swapwindow, u"

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

        ", print, exec, hyprshot -m region"
      ];

      binde = [
        "super alt, l, resizeactive, 10 0"
        "super alt, h, resizeactive, -10 0"
        "super alt, j, resizeactive, 0 10"
        "super alt, k, resizeactive, 0 -10"
      ];

      bindl = [
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"
      ];

      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        ", XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      bindm = [
        "super, mouse:272, movewindow"
      ];

      gesture = [
        "3, horizontal, workspace"
      ];
    };
  };
}
