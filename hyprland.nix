{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      bind = [
        "super, return, exec, kitty"
        "super, r, exec, ranger"
        "super, w, exec, librewolf"
        "super, space, exec, wofi --show drun"
        "super, q, killactive"
        "super, shift, q, exit"
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

        "super, shift, 1, workspace, 1"
        "super, shift, 2, workspace, 2"
        "super, 3, workspace, 3"
        "super, 4, workspace, 4"
        "super, 5, workspace, 5"
        "super, 6, workspace, 6"
        "super, 7, workspace, 7"
        "super, 8, workspace, 8"
        "super, 9, workspace, 9"
        "super, 0, workspace, 10"
      ];

      exec-once = [
        "waybar"
      ];
    };
  };
}
