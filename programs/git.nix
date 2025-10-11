{
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
}
