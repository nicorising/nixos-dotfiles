{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "all --ask --keep 3 --keep-since 7d";
  };
}
