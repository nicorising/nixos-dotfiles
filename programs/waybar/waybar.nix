{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        position = "top";
        layer = "top";

        modules-left = [
          "hyprland/workspaces"
        ];

        modules-center = [
          "custom/spotify"
        ];

        modules-right = [
          "pulseaudio"
          "backlight"
          "battery"
          "network"
          "clock"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            default = "";
            empty = "";
          };

          persistent-workspaces = {
            "*" = 10;
          };
        };

        "custom/spotify" = {
          exec = "playerctl --player=spotify metadata --format '{{ artist }} - {{ title }}'";
          exec-if = "pgrep spotify && [ \"$(playerctl -p spotify status 2>/dev/null)\" = \"Playing\" ]";
          interval = 1;

          format = ''<span font="12" color="#83a598">󰝚</span>  {}'';
          max-length = 50;
          escape = true;

          on-click = "playerctl --player=spotify play-pause";
          on-click-right = "playerctl --player=spotify next";
          on-click-middle = "playerctl --player=spotify previous";
        };

        pulseaudio = {
          format = ''<span font="12" color="#b8bb26">{icon}</span>  {volume}%'';
          format-muted = ''<span font="12" color="#b8bb26">󰸈</span>  {volume}%'';
          format-icons = {
            default = [
              "󰕿"
              "󰖀"
              "󰖀"
              "󰖀"
              "󰖀"
              "󰖀"
              "󰕾"
              "󰕾"
              "󰕾"
              "󰕾"
            ];
          };

          on-click = "pamixer -t";
          on-click-right = "pavucontrol";
          scroll-step = 1;
        };

        backlight = {
          format = ''<span font="11" color="#fabd2f">{icon}</span>  {percent}%'';
          format-icons = [
            "󰛩"
            "󱩎"
            "󱩏"
            "󱩐"
            "󱩑"
            "󱩒"
            "󱩓"
            "󱩔"
            "󱩕"
            "󱩖"
            "󰛨"
          ];

          on-scroll-up = "brightnessctl set 1%+";
          on-scroll-down = "brightnessctl set 1%-";
          on-click = "hyprctl hyprsunset identity";

          tooltip = false;
        };

        battery = {
          states = {
            warning = 30;
            critical = 10;
          };
          interval = 1;

          format = ''<span font="11" color="#83a598">{icon}</span>  {capacity}%'';
          format-charging = ''<span font="11" color="#83a598">{icon}</span>  {capacity}%'';
          format-warning = ''<span font="11" color="#fabd2f">{icon}</span>  {capacity}%'';
          format-critical = ''<span font="11" color="#fb4934">{icon}</span>  {capacity}%'';
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };

        network = {
          interval = 1;
          format-wifi = "{icon}";
          format-disconnected = "󰤮";
          format-icons = [
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          tooltip-format = "{ifname}: {ipaddr}/{cidr}\nSignal: {signalStrength}%";
          on-click = "nm-connection-editor";
        };

        clock = {
          interval = 1;
          format = ''<span font="11" color="#fe8019">󱑍</span>  {:%I:%M}'';
          format-alt = ''<span font="11" color="#fe8019">󱑍</span>  {:%m-%d-%Y %H:%M:%S}'';
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#fabd2f'><b>{}</b></span>";
              days = "<span color='#ebdbb2'><b>{}</b></span>";
              weeks = "<span color='#8ec07c'><b>W{}</b></span>";
              weekdays = "<span color='#b8bb26'><b>{}</b></span>";
              today = "<span color='#fb4934'><b><u>{}</u></b></span>";
            };
          };
        };
      };
    };

    style = ./waybar.css;
  };
}
