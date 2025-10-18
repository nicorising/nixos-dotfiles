{ pkgs, ... }:

{
  imports = [
    programs/btop.nix
    programs/git.nix
    programs/hypridle.nix
    programs/hyprland.nix
    programs/hyprlock.nix
    programs/hyprsunset.nix
    programs/kitty.nix
    programs/librewolf.nix
    programs/neovim.nix
    programs/ssh.nix
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
      hyprshot # Screenshot tool
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
      playerctl # CLI media player control
      python314 # Python 3.14
      ranger # TUI file explorer
      signal-desktop
      slack
      socat # Data relay tool
      spotify
      swww # Wallpaper manager
      tldr
      unzip # Unzip utility
      usbutils # USB CLI tools
      vlc # Media player
      waybar # Taskbar
      wev # Wayland event viewer
      wofi
      zathura # PDF viewer

      # Add custom scripts
      (writeShellScriptBin "hyprland-wallpapers" (builtins.readFile ./scripts/hyprland-wallpapers.sh))
    ];

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    shellAliases = {
      grep = "grep --color=auto";
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
