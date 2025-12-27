{ pkgs, ... }:

let
  writeScript = name: pkgs.writeShellScriptBin name (builtins.readFile ./scripts/${name}.sh);
in
{
  imports = [
    programs/btop.nix
    programs/git.nix
    programs/hypridle.nix
    programs/hyprland.nix
    programs/hyprlock.nix
    programs/kitty.nix
    programs/librewolf.nix
    programs/nh.nix
    programs/nixvim/nixvim.nix
    programs/ssh.nix
    programs/thunderbird.nix
    programs/vscode.nix
    programs/waybar/waybar.nix
  ];

  home = {
    username = "nico";
    homeDirectory = "/home/nico";

    packages = with pkgs; [
      bluez
      bluez-tools
      brightnessctl # CLI screen brightness control
      capitaine-cursors-themed # Cursor theme
      clojure # Clojure
      discord
      extremetuxracer
      fd # File finder
      gcc # Compilers
      hyprshot # Screenshot tool
      inotify-tools # Tools for inotify
      jq # CLI JSON processor
      keepassxc # Password manager
      killall # Process killing command
      libreoffice
      ncdu # Disk storage utility
      neofetch # System information display
      nerd-fonts.noto # Nerd fonts
      networkmanagerapplet # GUI for advanced network settings
      nil # Nix language server
      nixfmt-rfc-style # Nix formatter
      nodejs # Node.js
      pamixer
      pavucontrol
      pgadmin4-desktopmode # PostgreSQL GUI
      playerctl # CLI media player control
      popsicle # USB flasher
      prismlauncher
      python314 # Python 3.14
      ranger # TUI file explorer
      ripgrep # Search tool
      ruff # Python linter/formatter
      signal-desktop
      sl # Steam locomotive
      slack
      socat # Data relay tool
      spotify # Spotify
      steam # Steam
      swww # Wallpaper manager
      texlive.combined.scheme-full # LaTeX
      tldr # Quick manuals
      tree-sitter # Parser generator tool
      qFlipper # Flipper Zero GUI
      unzip # Unzip utility
      usbutils # USB CLI tools
      uv # Python package manager
      v4l-utils # Video4Linux utilities
      vlc # Media player
      waybar # Taskbar
      wev # Wayland event viewer
      wl-clipboard # Wayland clipboard CLI
      wofi
      zathura # PDF viewer

      # Add custom scripts
      (writeScript "bluetooth-menu")
      (writeScript "hyprland-wallpapers")
    ];

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    shellAliases = {
      grep = "grep --color=auto";
      ssh = "kitten ssh"; # Fix terminfo issues when SSHing from kitty
    };

    # Copy over wallpapers
    file.".local/share/wallpapers" = {
      source = ./wallpapers;
      recursive = true;
    };

    pointerCursor = {
      enable = true;
      package = pkgs.capitaine-cursors-themed;
      name = "Capitaine Cursors (Gruvbox)";
      size = 24;
    };

    stateVersion = "25.05";
  };

  programs.bash.enable = true;

  services = {
    hyprpolkitagent.enable = true;
    udiskie.enable = true;
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [
        "NotoSerif NFP"
      ];
      sansSerif = [
        "NotoSans NFP"
      ];
      monospace = [
        "NotoSansM NFM"
      ];
    };
  };

  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

  gtk = {
    enable = true;

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };
}
