{
  programs.git = {
    enable = true;

    settings = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;

      user = {
        name = "Nico Rising";
        email = "nico@nicorising.com";
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
  };
}
