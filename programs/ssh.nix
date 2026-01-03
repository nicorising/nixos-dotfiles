{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "nicorising.com" = {
        hostname = "nicorising.com";
        user = "nico";
        identityFile = "~/.ssh/nicorising_ed25519";
        identitiesOnly = true;
      };

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
}
