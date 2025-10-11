{ pkgs, ... }:

{
  imports = [
    programs/btop.nix
    programs/git.nix
    programs/hyprland.nix
    programs/hyprlock.nix
    programs/hyprsunset.nix
    programs/kitty.nix
    programs/librewolf.nix
    programs/neovim.nix
    programs/ssh.nix
    programs/vscode.nix
  ];

  home = {
    username = "nico";
    homeDirectory = "/home/nico";

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    packages = with pkgs; [
      bluez
      bluez-tools
      brightnessctl # CLI screen brightness control
      btop # System monitor
      capitaine-cursors-themed # Cursor theme
      hyprlock # Screen locker
      hyprpolkitagent # Polkit authentication agent
      hyprshot # Screenshot tool
      hyprsunset # Blue-light filtering
      jq # CLI JSON processor
      keepassxc # Password manager
      kitty # Terminal emulator
      libreoffice
      ncdu # Disk storage utility
      neofetch # System information display
      networkmanagerapplet # GUI for advanced network settings
      nil # Nix language server
      nixfmt-rfc-style # Nix formatter
      nerd-fonts.noto # Nerd fonts
      pamixer
      playerctl # CLI media player control
      python314
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

  fonts.fontconfig.enable = true;

  services.udiskie.enable = true;

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
