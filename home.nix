{ pkgs, ... }:

{
  imports = [
    ./hyprland.nix
  ];

  home = {
    username = "nico";
    homeDirectory = "/home/nico";

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
    sessionPath = [
      "$HOME/.local/bin"
    ];
  };

  home.packages = with pkgs; [
    bluez
    bluez-tools
    brightnessctl
    btop
    hyprlock
    hyprpolkitagent
    hyprshot
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

  fonts.fontconfig.enable = true;

  services.udiskie.enable = true;

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/github_ed25519";
        identitiesOnly = true;
      };
      "gitlab.com" = {
        hostname = "gitlab.com";
        user = "git";
        identityFile = "~/.ssh/gitlab_ed25519";
        identitiesOnly = true;
      };
    };
    enableDefaultConfig = false;
  };

  programs.git = {
    enable = true;
    userName = "Nico Rising";
    userEmail = "nico@nicorising.com";
    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
    aliases = {
      lg = "log --graph --oneline --all";
      pfwl = "push --force-with-lease";
      history = ''
        !f() {
          i=0
          while [ $i -lt 10 ]; do
            i=$((i + 1))
            ref=$(git rev-parse --symbolic-full-name @{-$i} 2> /dev/null) || break
            printf "@{-%d} %s\n" "$i" "$ref"
          done
        }
        f
      '';
    };
  };

  programs.neovim = {
    viAlias = true;
    vimAlias = true;
  };

  programs.librewolf = {
    enable = true;
    settings = {
      "webgl.disabled" = false;
      "privacy.resistFingerprinting" = false;
      "privacy.clearOnShutdown.cache" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "privacy.clearOnShutdown.downloads" = false;
      "privacy.clearOnShutdown.formdata" = false;
      "privacy.clearOnShutdown.history" = false;
      "network.cookie.lifetimePolicy" = 0;
    };
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jdinhlife.gruvbox
        jnoortheen.nix-ide
        vscodevim.vim
      ];
      userSettings = {
        window.autoDetectColorScheme = true;
        workbench.preferredDarkColorTheme = "Gruvbox Dark Hard";
        workbench.preferredLightColorTheme = "Gruvbox Light Hard";
        editor.formatOnSave = true;
        files.insertFinalNewline = true;
        files.trimFinalNewlines = true;
        nix = {
          enableLanguageServer = true;
          formatting = {
            command = [
              "nixfmt"
              "--width"
              "100"
            ];
          };
        };
      };
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

  home.stateVersion = "25.05";
}
