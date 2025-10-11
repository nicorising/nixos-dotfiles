{ pkgs, ... }:

{
  imports = [
    programs/git.nix
    programs/hyprland.nix
    programs/hyprlock.nix
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
      brightnessctl
      btop
      capitaine-cursors-themed
      hyprlock
      hyprpolkitagent
      hyprshot
      hyprsunset
      jq # CLI JSON processor
      keepassxc
      kitty
      libreoffice
      neofetch
      networkmanagerapplet
      nil # Nix language server
      nixfmt-rfc-style # Nix formatter
      nerd-fonts.noto
      pamixer
      python314
      ranger
      signal-desktop
      slack
      socat # Data relay tool
      spotify
      swww # Wallpaper manager
      tldr
      unzip
      usbutils
      vlc
      waybar
      wofi
      zathura

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
