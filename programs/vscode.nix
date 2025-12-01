{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        charliermarsh.ruff
        esbenp.prettier-vscode
        jdinhlife.gruvbox
        jnoortheen.nix-ide
        tamasfe.even-better-toml
        vscodevim.vim
      ];

      userSettings = {
        editor = {
          fontFamily = "'NotoSansM NFM', monospace";
          formatOnSave = true;
          codeActionsOnSave."source.fixAll" = "explicit";
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

        "[python]" = {
          editor.defaultFormatter = "charliermarsh.ruff";
        };
        "[javascript]" = {
          editor.defaultFormatter = "esbenp.prettier-vscode";
        };
        "[typescript]" = {
          editor.defaultFormatter = "esbenp.prettier-vscode";
        };
        "[javascriptreact]" = {
          editor.defaultFormatter = "esbenp.prettier-vscode";
        };
        "[typescriptreact]" = {
          editor.defaultFormatter = "esbenp.prettier-vscode";
        };
      };
    };
  };
}
