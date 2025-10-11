{
  programs.librewolf = {
    enable = true;

    settings = {
      "webgl.disabled" = false;
      "privacy.resistFingerprinting" = false;
      "privacy.clearOnShutdown.cache" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "privacy.clearOnShutdown.downloads" = false;
      "privacy.clearOnShutdown.formdata" = false;
      "privacy.clearOnShutdown.history" = false;
      "network.cookie.lifetimePolicy" = 0;
    };
  };
}
