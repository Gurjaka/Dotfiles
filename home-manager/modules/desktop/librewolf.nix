{
  pkgs,
  user,
  ...
}: {
  programs.librewolf = {
    enable = true;

    policies = {
      # Disable access to about:config to prevent manual tampering
      BlockAboutConfig = true;

      # Set default download location
      DefaultDownloadDirectory = "\${home}/Downloads";

      # Enforce extension installation policy
      # To add additional extensions, find it on addons.mozilla.org, find
      # the short ID in the url (like https://addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
      # Then, download the XPI by filling it in to the install_url template, unzip it,
      # run `jq .browser_specific_settings.gecko.id manifest.json` or
      # `jq .applications.gecko.id manifest.json` to get the UUID
      ExtensionSettings = with builtins; let
        extension = shortId: uuid: {
          name = uuid;
          value = {
            install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
            installation_mode = "normal_installed";
          };
        };
      in
        listToAttrs [
          # uBlock Origin: ad & content blocker
          (extension "ublock-origin" "uBlock0@raymondhill.net")
          # Bitwarden: password manager
          (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
          # Dark Reader: dark mode for all websites
          (extension "darkreader" "addon@darkreader.org")
          # Tridactyl: Vim, but in your browser
          (extension "tridactyl-vim" "tridactyl.vim@cmcaine.co.uk")
          # DuckDuckGo Privacy Essentials
          (extension "duckduckgo-for-firefox" "jid1-ZAdIEUB7XOzOJw@jetpack")
          # Privacy Badger by EFF
          (extension "privacy-badger17" "jid1-MnnxcxisBPnSXQ@jetpack")
          # GitHub Material Icons (aesthetic)
          (extension "material-icons-for-github" "{eac6e624-97fa-4f28-9d24-c06c9b8aa713}")
          # Simple Tab Groups: organize tabs by groups
          (extension "simple-tab-groups" "simple-tab-groups@drive4ik")
        ]
        // {
          # Block all extensions by default
          "*".installation_mode = "blocked";
        };
    };

    profiles.${user} = {
      isDefault = true;

      search = {
        force = true;
        default = "ddg";
        privateDefault = "ddg";

        engines = {
          # Custom search engine for Nix packages
          nix-packages = {
            name = "Nix Packages";
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@np"];
          };

          nix-options = {
            name = "Nix Options";
            urls = [
              {
                template = "https://search.nixos.org/options";
                params = [
                  {
                    name = "type";
                    value = "options";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@no"];
          };

          # Custom search engine for NixOS Wiki
          nixos-wiki = {
            name = "NixOS Wiki";
            urls = [{template = "https://wiki.nixos.org/w/index.php?search={searchTerms}";}];
            iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
            definedAliases = ["@nw"];
          };
          home-manager-options = {
            name = "Home Manager Options";
            urls = [
              {
                template = "https://home-manager-options.extranix.com/";
                params = [
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "https://home-manager-options.extranix.com/favicon.ico";
            definedAliases = ["@hm"];
          };
        };
      };

      settings = {
        # Enable all extensions by default
        "extensions.autoDisableScopes" = 0;

        # Minimal homepage and UI
        "browser.startup.homepage" = "about:blank";
        "browser.startup.page" = 3; # 3 = restore previous session
        "browser.display.use_document_fonts" = 0;
        "browser.display.document_color_use" = 0;
        "browser.newtabpage.enabled" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.default.sites" = "";
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;

        # URL bar suggestions config
        "browser.urlbar.suggest.history" = false;
        "browser.urlbar.suggest.bookmark" = true;
        "browser.urlbar.suggest.openpage" = false;
        "browser.urlbar.suggest.topsites" = false;

        # Enable custom CSS theming
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        # Enable GPU acceleration and WebRender
        "layers.acceleration.force-enabled" = true;
        "gfx.webrender.all" = true;

        # Required for themed icons
        "svg.context-properties.content.enabled" = true;

        # Quality-of-life
        "general.autoScroll" = true;
        "sidebar.verticalTabs" = true;
        "sidebar.visibility" = "always-show";

        # Allow WebGL
        "webgl.disabled" = false;

        # Privacy and tracking protection
        "privacy.resistFingerprinting" = false;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.trackingprotection.cryptominings.enabled" = true;
        "privacy.trackingprotection.fingerprinting.enabled" = true;

        # Configure what gets cleared on shutdown
        "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
        "privacy.clearOnShutdown.cookies" = false;
        "privacy.clearOnShutdown.history" = false;
        "privacy.clearOnShutdown.formdata" = true;

        # Cookie behavior
        "network.cookie.lifetimePolicy" = 0;
        "network.cookie.cookieBehavior" = 2;

        # HTTPS only
        "dom.security.https_only_mode" = true;

        # Disable telemetry & reporting
        "datareporting.healthreport.uploadEnabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.archive.enabled" = false;

        # Don’t remember passwords
        "signon.rememberSignons" = false;

        # Enable dark mode in private windows
        "browser.theme.dark-private-windows" = true;
        "extensions.activeThemeID" = "firefox-dark@mozilla.org";
        # "browser.compactmode.show" = true;

        # Enable DNS-over-HTTPS (Cloudflare)
        "network.trr.mode" = 2;
        "network.trr.uri" = "https://dns.cloudflare.com/dns-query";

        # Disable WebRTC and geolocation
        "media.peerconnection.enabled" = false;
        "geo.enabled" = false;

        # Disable Pocket
        "extensions.pocket.enabled" = false;

        # UX polish
        "general.smoothScroll" = true;
        "toolkit.cosmeticAnimations.enabled" = false;

        # Network tweaks
        "network.dns.disableIPv6" = false;
        "network.predictor.enable-prefetch" = false;

        # TLS hardening
        "security.tls.version.min" = 3;
        "security.tls.version.max" = 4;
        "security.ssl3.rsa_aes_128_sha" = false;
        "security.ssl3.rsa_aes_256_sha" = false;
      };

      bookmarks = {
        force = true;
        settings = [
          {
            name = "Nix";
            toolbar = true;
            bookmarks = [
              {
                name = "homepage";
                url = "https://nixos.org/";
              }
              {
                name = "wiki";
                url = "https://wiki.nixos.org/";
                tags = ["wiki" "nix"];
              }
              {
                name = "pkgs";
                url = "https://search.nixos.org/packages";
              }
              {
                name = "options";
                url = "https://search.nixos.org/options";
              }
              {
                name = "hm Options";
                url = "https://home-manager-options.extranix.com/";
              }
            ];
          }
        ];
      };
    };
  };
}
