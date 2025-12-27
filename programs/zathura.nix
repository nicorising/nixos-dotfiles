{
  programs.zathura = {
    enable = true;

    options = {
      selection-clipboard = "clipboard";
      synctex = true;
      synctex-editor-command = "nvim --headless -c \"VimtexInverseSearch %{line} '%{input}'\"";
    };
  };
}
