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
}
