{user, ...}: {
  programs.librewolf = {
    enable = false;
    policies = {
      ExtensionSettings = {
        "*".installation_mode = "blocked";
        # To add additional extensions, find it on addons.mozilla.org, find
        # the short ID in the url (like https://addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
        # Then, download the XPI by filling it in to the install_url template, unzip it,
        # run `jq .browser_specific_settings.gecko.id manifest.json` or
        # `jq .applications.gecko.id manifest.json` to get the UUID
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/en-us/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };
        "addon@darkreader.org" = {
          install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/darkreader/latest.xpi";
          installation_mode = "force_installed";
        };
        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/vimium-ff/latest.xpi";
          installation_mode = "force_installed";
        };
        "jid1-ZAdIEUB7XOzOJw@jetpack" = {
          install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/duckduckgo-for-firefox/latest.xpi";
          installation_mode = "force_installed";
        };
        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/privacy-badger17/latest.xpi";
          installation_mode = "force_installed";
        };
        "{eac6e624-97fa-4f28-9d24-c06c9b8aa713}" = {
          install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/material-icons-for-github/latest.xpi";
          installation_mode = "force_installed";
        };
        "simple-tab-groups@drive4ik" = {
          install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/simple-tab-groups/latest.xpi";
          installation_mode = "force_installed";
        };
      };
      Bookmarks = [
        {
          name = "Nix";
          toolbar = true;
          bookmarks = [
            {
              name = "PKGS";
              url = "https://search.nixos.org/packages";
            }
            {
              name = "Options";
              url = "https://search.nixos.org/options";
            }
            {
              name = "HM Options";
              url = "https://home-manager-options.extranix.com/";
            }
          ];
        }
      ];
    };
    settings = {
      "extensions.autoDisableScopes" = 0;
      "browser.display.use_document_fonts" = 0;
      "browser.display.document_color_use" = 0;
      "browser.toolbars.bookmarks.visibility" = "never";
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      "layers.acceleration.force-enabled" = true;
      "gfx.webrender.all" = true;
      "svg.context-properties.content.enabled" = true;
      "general.autoScroll" = true;
      "sidebar.verticalTabs" = true;
      "sidebar.visibility" = "always-show";
    };
    profiles.${user} = {
      isDefault = true;
    };
  };
}
