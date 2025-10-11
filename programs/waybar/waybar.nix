{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        position = "top";
        layer = "top";

        height = 28;
        spacing = 4;

        modules-left = [
          "hyprland/workspaces"
          "custom/spotify"
        ];

        modules-right = [
          "pulseaudio"
          "backlight"
          "cpu"
          "memory"
          "battery"
          "network"
          "clock"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            empty = "";
            default = "";
            active = "";
            urgent = "";
          };

          persistent-workspaces = {
            "*" = 10;
          };
        };

        # Spotify
        "custom/spotify" = {
          exec = "playerctl --player=spotify metadata --format '{{ artist }} - {{ title }}'";
          exec-if = "pgrep spotify";
          interval = 1;
          format = "󰝚  {}";
          max-length = 64;
          on-click = "playerctl --player=spotify play-pause";
          on-click-right = "playerctl --player=spotify next";
          on-click-middle = "playerctl --player=spotify previous";
        };

        # Volume
        pulseaudio = {
          format = "{icon}  {volume}%";
          format-muted = "󰸈  {volume}%";
          format-icons = {
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          on-click = "pamixer -t";
          on-click-right = "pavucontrol";
          scroll-step = 5;
        };

        # Backlight
        backlight = {
          device = "intel_backlight";
          format = "{icon}  {percent}%";
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
          on-scroll-up = "brightnessctl set +5%";
          on-scroll-down = "brightnessctl set 5%-";
        };

        # CPU
        cpu = {
          interval = 2;
          format = "󰒆  {usage}%";
          tooltip = false;
        };

        # Memory
        memory = {
          interval = 2;
          format = "󰄦  {percentage}%";
          tooltip-format = "{used:0.1f}G / {total:0.1f}G";
        };

        # Battery
        battery = {
          interval = 30;
          states = {
            warning = 30;
            critical = 10;
          };
          format = "{icon}  {capacity}%";
          format-charging = "{icon}  {capacity}%";
          format-full = "{icon}  {capacity}%";
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
          format-charging-icons = [
            "󰢜"
            "󰂆"
            "󰂇"
            "󰂈"
            "󰢝"
            "󰂉"
            "󰢞"
            "󰂊"
            "󰂋"
            "󰂅"
          ];
        };

        # Network
        network = {
          interface = "wlp0s20f3";
          interval = 2;
          format-wifi = "{icon}  {essid}";
          format-disconnected = "󰤮  Disconnected";
          format-icons = [
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          tooltip-format = "{ifname}: {ipaddr}/{cidr}\nSignal: {signalStrength}%";
          on-click = "nm-connection-editor";
        };

        # Clock
        clock = {
          interval = 1;
          format = "󱑍  {:%H:%M}";
          format-alt = "󱑍  {:%m-%d-%Y %H:%M:%S}";
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
