{ user, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        DisableTelemetry = true;
        ExtensionSettings = {
          "*".installation_mode = "blocked";
          # To add additional extensions, find it on addons.mozilla.org, find
          # the short ID in the url (like https://addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
          # Then, download the XPI by filling it in to the install_url template, unzip it,
          # run `jq .browser_specific_settings.gecko.id manifest.json` or
          # `jq .applications.gecko.id manifest.json` to get the UUID
          "uBlock0@raymondhill.net" = { 
            install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/ublock-origin/latest.xpi";
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
          "tridactyl.vim@cmcaine.co.uk" = {
            install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/tridactyl-vim/latest.xpi";
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
        };
      };
    };
    profiles.${user} = {
      isDefault = true;
      search = {
        default = "DuckDuckGo";
        privateDefault = "DuckDuckGo";
        force = true;
      };
      settings = {
        "extensions.autoDisableScopes" = 0;
        "browser.display.use_document_fonts" = 0;
        "font.name.monospace.x-western" = "Fira Code";
        "font.name.sans-serif.x-western" = "Fira Code";
        "font.name.serif.x-western" = "Fira Code";
        "browser.display.document_color_use" = 0;
      };
      bookmarks = [
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
      extraConfig = ''
        user_pref("_user.js.parrot", "START: Oh yes, the Norwegian Blue... what's wrong with it?");
        user_pref("browser.aboutConfig.showWarning", false);
        user_pref("_user.js.parrot", "0100 syntax error: the parrot's dead!");
        user_pref("browser.startup.page", 3);
        user_pref("browser.startup.homepage", "about:blank");
        user_pref("browser.newtabpage.enabled", false);
        user_pref("browser.newtabpage.activity-stream.showSponsored", false); 
        user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false); 
        user_pref("browser.newtabpage.activity-stream.default.sites", "");
        user_pref("_user.js.parrot", "0200 syntax error: the parrot's definitely deceased!");
        user_pref("geo.provider.ms-windows-location", false); 
        user_pref("geo.provider.use_corelocation", false); 
        user_pref("geo.provider.use_geoclue", false); 
        user_pref("_user.js.parrot", "0300 syntax error: the parrot's not pinin' for the fjords!");
        user_pref("extensions.getAddons.showPane", false); 
        user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
        user_pref("browser.discovery.enabled", false);
        user_pref("browser.shopping.experience2023.enabled", false); // [DEFAULT: false]
        user_pref("datareporting.policy.dataSubmissionEnabled", false);
        user_pref("datareporting.healthreport.uploadEnabled", false);
        user_pref("toolkit.telemetry.unified", false);
        user_pref("toolkit.telemetry.enabled", false); // see [NOTE]
        user_pref("toolkit.telemetry.server", "data:,");
        user_pref("toolkit.telemetry.archive.enabled", false);
        user_pref("toolkit.telemetry.newProfilePing.enabled", false); // [FF55+]
        user_pref("toolkit.telemetry.shutdownPingSender.enabled", false); // [FF55+]
        user_pref("toolkit.telemetry.updatePing.enabled", false); // [FF56+]
        user_pref("toolkit.telemetry.bhrPing.enabled", false); // [FF57+] Background Hang Reporter
        user_pref("toolkit.telemetry.firstShutdownPing.enabled", false); // [FF57+]
        user_pref("toolkit.telemetry.coverage.opt-out", true); // [HIDDEN PREF]
        user_pref("toolkit.coverage.opt-out", true); // [FF64+] [HIDDEN PREF]
        user_pref("toolkit.coverage.endpoint.base", "");
        user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
        user_pref("browser.newtabpage.activity-stream.telemetry", false);
        user_pref("app.shield.optoutstudies.enabled", false);
        user_pref("app.normandy.enabled", false);
        user_pref("app.normandy.api_url", "");
        user_pref("breakpad.reportURL", "");
        user_pref("browser.tabs.crashReporting.sendReport", false); // [FF44+]
        user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false); // [DEFAULT: false]
        user_pref("captivedetect.canonicalURL", "");
        user_pref("network.captive-portal-service.enabled", false); // [FF52+]
        user_pref("network.connectivity-service.enabled", false);
        user_pref("_user.js.parrot", "0400 syntax error: the parrot's passed on!");
        user_pref("browser.safebrowsing.downloads.remote.enabled", false);
        user_pref("_user.js.parrot", "0600 syntax error: the parrot's no more!");
        user_pref("network.prefetch-next", false);
        user_pref("network.dns.disablePrefetch", true);
        user_pref("network.dns.disablePrefetchFromHTTPS", true);
        user_pref("network.predictor.enabled", false);
        user_pref("network.predictor.enable-prefetch", false); // [FF48+] [DEFAULT: false]
        user_pref("network.http.speculative-parallel-limit", 0);
        user_pref("browser.places.speculativeConnect.enabled", false);
        user_pref("_user.js.parrot", "0700 syntax error: the parrot's given up the ghost!");
        user_pref("network.proxy.socks_remote_dns", true);
        user_pref("network.file.disable_unc_paths", true); // [HIDDEN PREF]
        user_pref("network.gio.supported-protocols", ""); // [HIDDEN PREF] [DEFAULT: "" FF118+]
        user_pref("_user.js.parrot", "0800 syntax error: the parrot's ceased to be!");
        user_pref("browser.urlbar.speculativeConnect.enabled", false);
        user_pref("browser.urlbar.quicksuggest.enabled", false); // [FF92+]
        user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false); // [FF95+]
        user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false); // [FF92+]
        user_pref("browser.search.suggest.enabled", false);
        user_pref("browser.urlbar.suggest.searches", false);
        user_pref("browser.urlbar.trending.featureGate", false);
        user_pref("browser.urlbar.addons.featureGate", false); // [FF115+]
        user_pref("browser.urlbar.mdn.featureGate", false); // [FF117+] [HIDDEN PREF]
        user_pref("browser.urlbar.pocket.featureGate", false); // [FF116+] [DEFAULT: false]
        user_pref("browser.urlbar.weather.featureGate", false); // [FF108+] [DEFAULT: false]
        user_pref("browser.urlbar.yelp.featureGate", false); // [FF124+] [DEFAULT: false]
        user_pref("browser.formfill.enable", false);
        user_pref("browser.search.separatePrivateDefault", true); // [FF70+]
        user_pref("browser.search.separatePrivateDefault.ui.enabled", true); // [FF71+]
        user_pref("_user.js.parrot", "0900 syntax error: the parrot's expired!");
        user_pref("signon.autofillForms", false);
        user_pref("signon.formlessCapture.enabled", false);
        user_pref("network.auth.subresource-http-auth-allow", 1);
        user_pref("_user.js.parrot", "1000 syntax error: the parrot's gone to meet 'is maker!");
        user_pref("browser.cache.disk.enable", false);
        user_pref("browser.privatebrowsing.forceMediaMemoryCache", true); // [FF75+]
        user_pref("media.memory_cache_max_size", 65536);
        user_pref("browser.sessionstore.privacy_level", 2);
        user_pref("toolkit.winRegisterApplicationRestart", false);
        user_pref("browser.shell.shortcutFavicons", false);
        user_pref("_user.js.parrot", "1200 syntax error: the parrot's a stiff!");
        user_pref("security.ssl.require_safe_negotiation", true);
        user_pref("security.tls.enable_0rtt_data", false);
        user_pref("security.OCSP.enabled", 1); // [DEFAULT: 1]
        user_pref("security.OCSP.require", true);
        user_pref("security.cert_pinning.enforcement_level", 2);
        user_pref("security.remote_settings.crlite_filters.enabled", true);
        user_pref("security.pki.crlite_mode", 2);
        user_pref("dom.security.https_only_mode", true); // [FF76+]
        user_pref("dom.security.https_only_mode_send_http_background_request", false);
        user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
        user_pref("browser.xul.error_pages.expert_bad_cert", true);
        user_pref("_user.js.parrot", "1600 syntax error: the parrot rests in peace!");
        user_pref("network.http.referer.XOriginTrimmingPolicy", 2);
        user_pref("_user.js.parrot", "1700 syntax error: the parrot's bit the dust!");
        user_pref("privacy.userContext.enabled", true);
        user_pref("privacy.userContext.ui.enabled", true);
        user_pref("_user.js.parrot", "2000 syntax error: the parrot's snuffed it!");
        user_pref("media.peerconnection.ice.proxy_only_if_behind_proxy", true);
        user_pref("media.peerconnection.ice.default_address_only", true);
        user_pref("_user.js.parrot", "2400 syntax error: the parrot's kicked the bucket!");
        user_pref("dom.disable_window_move_resize", true);
        user_pref("_user.js.parrot", "2600 syntax error: the parrot's run down the curtain!");
        user_pref("browser.download.start_downloads_in_tmp_dir", true); // [FF102+]
        user_pref("browser.helperApps.deleteTempFileOnExit", true);
        user_pref("browser.uitour.enabled", false);
        user_pref("devtools.debugger.remote-enabled", false); // [DEFAULT: false]
        user_pref("permissions.manager.defaultsUrl", "");
        user_pref("webchannel.allowObject.urlWhitelist", "");
        user_pref("network.IDN_show_punycode", true);
        user_pref("pdfjs.disabled", false); // [DEFAULT: false]
        user_pref("pdfjs.enableScripting", false); // [FF86+]
        user_pref("browser.tabs.searchclipboardfor.middleclick", false); // [DEFAULT: false NON-LINUX]
        user_pref("browser.contentanalysis.enabled", false); // [FF121+] [DEFAULT: false]
        user_pref("browser.contentanalysis.default_result", 0); // [FF127+] [DEFAULT: 0]
        user_pref("browser.download.useDownloadDir", false);
        user_pref("browser.download.alwaysOpenPanel", false);
        user_pref("browser.download.manager.addToRecentDocs", false);
        user_pref("browser.download.always_ask_before_handling_new_types", true);
        user_pref("extensions.enabledScopes", 5); // [HIDDEN PREF]
        user_pref("extensions.postDownloadThirdPartyPrompt", false);
        user_pref("_user.js.parrot", "2700 syntax error: the parrot's joined the bleedin' choir invisible!");
        user_pref("browser.contentblocking.category", "strict"); // [HIDDEN PREF]
        user_pref("_user.js.parrot", "2800 syntax error: the parrot's bleedin' demised!");
        user_pref("privacy.sanitize.sanitizeOnShutdown", true);
        user_pref("privacy.clearOnShutdown.cache", true);     // [DEFAULT: true]
        user_pref("privacy.clearOnShutdown_v2.cache", true);  // [FF128+] [DEFAULT: true]
        user_pref("privacy.clearOnShutdown.downloads", true); // [DEFAULT: true]
        user_pref("privacy.clearOnShutdown.formdata", false);  // [DEFAULT: true]
        user_pref("privacy.clearOnShutdown.history", false);   // [DEFAULT: true]
        user_pref("privacy.clearOnShutdown_v2.historyFormDataAndDownloads", false); // [FF128+] [DEFAULT: true]
        user_pref("privacy.clearOnShutdown.cookies", false); // Cookies
        user_pref("privacy.clearOnShutdown.offlineApps", true); // Site Data
        user_pref("privacy.clearOnShutdown.sessions", false);  // Active Logins [DEFAULT: true]
        user_pref("privacy.clearOnShutdown_v2.cookiesAndStorage", false); // Cookies, Site Data, Active Logins [FF128+]
        user_pref("privacy.clearSiteData.cache", true);
        user_pref("privacy.clearSiteData.cookiesAndStorage", false); // keep false until it respects "allow" site exceptions
        user_pref("privacy.clearSiteData.historyFormDataAndDownloads", true);
        user_pref("privacy.cpd.cache", true);    // [DEFAULT: true]
        user_pref("privacy.clearHistory.cache", true);
        user_pref("privacy.cpd.formdata", false); // [DEFAULT: true]
        user_pref("privacy.cpd.history", true);  // [DEFAULT: true]
        user_pref("privacy.clearHistory.historyFormDataAndDownloads", true);
        user_pref("privacy.cpd.cookies", false);
        user_pref("privacy.cpd.sessions", true); // [DEFAULT: true]
        user_pref("privacy.cpd.offlineApps", false); // [DEFAULT: false]
        user_pref("privacy.clearHistory.cookiesAndStorage", false);
        user_pref("privacy.sanitize.timeSpan", 0);
        user_pref("_user.js.parrot", "4000 syntax error: the parrot's bereft of life!");
        user_pref("_user.js.parrot", "4500 syntax error: the parrot's popped 'is clogs");
        user_pref("privacy.window.maxInnerWidth", 1600);
        user_pref("privacy.window.maxInnerHeight", 900);
        user_pref("privacy.resistFingerprinting.block_mozAddonManager", true);
        user_pref("privacy.spoof_english", 1);
        user_pref("browser.display.use_system_colors", true); // [DEFAULT: false NON-WINDOWS]
        user_pref("browser.link.open_newwindow", 3); // [DEFAULT: 3]
        user_pref("browser.link.open_newwindow.restriction", 0);
        user_pref("_user.js.parrot", "5000 syntax error: the parrot's taken 'is last bow");
        user_pref("_user.js.parrot", "5500 syntax error: this is an ex-parrot!");
        user_pref("_user.js.parrot", "6000 syntax error: the parrot's 'istory!");
        user_pref("extensions.blocklist.enabled", true); // [DEFAULT: true]
        user_pref("network.http.referer.spoofSource", false); // [DEFAULT: false]
        user_pref("security.dialog_enable_delay", 1000); // [DEFAULT: 1000]
        user_pref("privacy.firstparty.isolate", false); // [DEFAULT: false]
        user_pref("extensions.webcompat.enable_shims", true); // [HIDDEN PREF] [DEFAULT: true]
        user_pref("security.tls.version.enable-deprecated", false); // [DEFAULT: false]
        user_pref("extensions.webcompat-reporter.enabled", false); // [DEFAULT: false]
        user_pref("extensions.quarantinedDomains.enabled", true); // [DEFAULT: true]
        user_pref("_user.js.parrot", "7000 syntax error: the parrot's pushing up daisies!");
        user_pref("_user.js.parrot", "8000 syntax error: the parrot's crossed the Jordan");
        user_pref("_user.js.parrot", "9000 syntax error: the parrot's cashed in 'is chips!");
        user_pref("browser.startup.homepage_override.mstone", "ignore"); // [HIDDEN PREF]
        user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
        user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);
        user_pref("browser.urlbar.showSearchTerms.enabled", false);
        user_pref("_user.js.parrot", "9999 syntax error: the parrot's shuffled off 'is mortal coil!");
        user_pref("_user.js.parrot", "SUCCESS: No no he's not dead, he's, he's restin'!");
      '';
    };
  };
}
