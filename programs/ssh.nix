{
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
  };
}
