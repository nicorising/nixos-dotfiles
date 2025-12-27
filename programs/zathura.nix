{
  programs.zathura = {
    enable = true;

    options = {
      selection-clipboard = "clipboard";
      synctex = true;
      synctex-editor-command = "nvim --headless -c \"VimtexInverseSearch %{line} '%{input}'\"";

      recolor = true;
      recolor-keephue = true;
      recolor-lightcolor = "#282828";
      recolor-darkcolor = "#ebdbb2";

      default-bg = "#282828";
      default-fg = "#ebdbb2";
      statusbar-bg = "#282828";
      statusbar-fg = "#ebdbb2";
      inputbar-bg = "#282828";
      inputbar-fg = "#ebdbb2";
      notification-bg = "#282828";
      notification-fg = "#ebdbb2";
      notification-error-bg = "#282828";
      notification-error-fg = "#fb4934";
      notification-warning-bg = "#282828";
      notification-warning-fg = "#fabd2f";
      highlight-color = "#fabd2f";
      highlight-active-color = "#fe8019";
      completion-bg = "#3c3836";
      completion-fg = "#ebdbb2";
      completion-highlight-bg = "#83a598";
      completion-highlight-fg = "#282828";
    };
  };
}
