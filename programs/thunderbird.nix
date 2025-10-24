{ config, pkgs, ... }:

{
  # Define email accounts globally
  accounts.email = {
    maildirBasePath = "mail";

    accounts = {
      personal = {
        primary = true;
        address = "nico@nicorising.com";
        userName = "nico@nicorising.com";
        realName = "Nico Rising";

        imap = {
          host = "mail.nicorising.com";
          port = 993;
          tls.enable = true;
        };

        smtp = {
          host = "mail.nicorising.com";
          port = 465;
          tls.enable = true;
        };

        thunderbird = {
          enable = true;
          profiles = [ "default" ];
        };
      };
    };
  };

  # Thunderbird program configuration (simplified)
  programs.thunderbird = {
    enable = true;

    profiles.default = {
      isDefault = true;

      # General Thunderbird settings (not account-specific)
      settings = {
        "general.useragent.override" = "";
        "network.cookie.cookieBehavior" = 2;

        # Security
        "security.tls.version.min" = 3;
        "security.tls.version.max" = 4;

        # UI preferences
        "mail.biff.show_alert" = true;
        "mail.biff.use_system_alert" = true;

        # Performance
        "browser.cache.disk.enable" = true;
        "browser.cache.memory.capacity" = 256000;
      };
    };
  };
}
