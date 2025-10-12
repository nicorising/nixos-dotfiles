{ pkgs, ... }:

{
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
        editor = {
          formatOnSave = true;
          fontFamily = "'NotoSansM NFM', monospace";
        };

        files = {
          insertFinalNewline = true;
          trimFinalNewlines = true;
        };

        window.autoDetectColorScheme = true;
        workbench = {
          preferredDarkColorTheme = "Gruvbox Dark Hard";
          preferredLightColorTheme = "Gruvbox Light Hard";
        };

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
}
