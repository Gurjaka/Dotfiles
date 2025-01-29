{user, ...}: {
  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
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
        "font.name.monospace.x-western" = "JetBrains Mono";
        "font.name.sans-serif.x-western" = "JetBrains Mono";
        "font.name.serif.x-western" = "JetBrains Mono";
        "browser.display.document_color_use" = 0;
        "browser.toolbars.bookmarks.visibility" = "never";
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "layers.acceleration.force-enabled" = true;
        "gfx.webrender.all" = true;
        "svg.context-properties.content.enabled" = true;
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
      userChrome = ''
                 :root {

                    /*---+---+---+---+---+---+---+
                     | C | O | L | O | U | R | S |
                     +---+---+---+---+---+---+---*/

                    /* Comment the color theme you don't want to use */

                    /* Dark Theme Colors */
                    --window-colour:               #2e3440;
                    --secondary-colour:            #4c566a;
                    --inverted-colour:             #d8dee9;

                    /* Light Theme Colors
                    --window-colour:               #FAFAFC;
                    --secondary-colour:            #EAEAEC;
                    --inverted-colour:             #1E2021;
                    */


                    /* Containter Tab Colours */
                    --uc-identity-color-blue:      #7ED6DF;
                    --uc-identity-color-turquoise: #55E6C1;
                    --uc-identity-color-green:     #B8E994;
                    --uc-identity-color-yellow:    #F7D794;
                    --uc-identity-color-orange:    #F19066;
                    --uc-identity-color-red:       #FC5C65;
                    --uc-identity-color-pink:      #F78FB3;
                    --uc-identity-color-purple:    #786FA6;


                    /* URL colour in URL bar suggestions */
                    --urlbar-popup-url-color: var(--uc-identity-color-purple) !important;



                    /*---+---+---+---+---+---+---+
                     | V | I | S | U | A | L | S |
                     +---+---+---+---+---+---+---*/

                    /* global border radius */
                    --uc-border-radius: 0;

                    /* dynamic url bar width settings */
                    --uc-urlbar-width: clamp(250px, 50vw, 600px);

                    /* dynamic tab width settings */
                    --uc-active-tab-width:   clamp( 50px, 18vw, 220px);
                    --uc-inactive-tab-width: clamp( 50px, 15vw, 200px);

                    /* if active always shows the tab close button */
                    --show-tab-close-button: none; /* DEFAULT: -moz-inline-box; */

                    /* if active only shows the tab close button on hover*/
                    --show-tab-close-button-hover: -moz-inline-box; /* DEFAULT: -moz-inline-box; */

                    /* adds left and right margin to the container-tabs indicator */
                    --container-tabs-indicator-margin: 0px;

                }

                    /*---+---+---+---+---+---+---+
                     | B | U | T | T | O | N | S |
                     +---+---+---+---+---+---+---*/

                     /* showing only the back button */
                     #back-button{ display: -moz-inline-box !important; }
                     #forward-button{ display: none !important; }
                     #stop-button{ display: none !important; }
                     #reload-button{ display: none !important; }

                     /* bookmark icon */
                     #star-button{ display: none !important; }

                     /* zoom indicator */
                     #urlbar-zoom-button { display: none !important; }

                     /* Show Hamburger Menu */
                     #PanelUI-button { display: -moz-inline-box !important;}

                     #reader-mode-button{ display: none !important; }

                     /* tracking protection shield icon */
                     #tracking-protection-icon-container { display: none !important; }

                     /* #identity-box { display: none !important } /* hides encryption AND permission items */
                     #identity-permission-box { display: none !important; } /* only hides permission items */

                     /* e.g. playing indicator (secondary - not icon) */
                     .tab-secondary-label { display: none !important; }

                     #pageActionButton { display: none !important; }
                     #page-action-buttons { display: none !important; }





                /*=============================================================================================*/


                /*---+---+---+---+---+---+
                 | L | A | Y | O | U | T |
                 +---+---+---+---+---+---*/

                /* No need to change anything below this comment.
                 * Just tweak it if you want to tweak the overall layout. c: */

                :root {

                    --uc-theme-colour:                          var(--window-colour);
                    --uc-hover-colour:                          var(--secondary-colour);
                    --uc-inverted-colour:                       var(--inverted-colour);

                    --button-bgcolor:                           var(--uc-theme-colour)    !important;
                    --button-hover-bgcolor:                     var(--uc-hover-colour)    !important;
                    --button-active-bgcolor:                    var(--uc-hover-colour)    !important;

                    --toolbar-bgcolor:                          var(--uc-theme-colour)    !important;
                    --toolbarbutton-hover-background:           var(--uc-hover-colour)    !important;
                    --toolbarbutton-active-background:          var(--uc-hover-colour)    !important;
                    --toolbarbutton-border-radius:              var(--uc-border-radius)   !important;
                    --lwt-toolbar-field-focus:                  var(--uc-theme-colour)    !important;
                    --toolbarbutton-icon-fill:                  var(--uc-inverted-colour) !important;
                    --toolbar-field-focus-background-color:     var(--secondary-colour)   !important;
                    --toolbar-field-color:                      var(--uc-inverted-colour) !important;
                    --toolbar-field-focus-color:                var(--uc-inverted-colour) !important;

                    --tabs-border-color:                        var(--uc-theme-colour)    !important;
                    --tab-border-radius:                        var(--uc-border-radius)   !important;
                    --lwt-text-color:                           var(--uc-inverted-colour) !important;
                    --lwt-tab-text:                             var(--uc-inverted-colour) !important;

                    --lwt-sidebar-background-color:             var(--uc-hover-colour)    !important;
                    --lwt-sidebar-text-color:                   var(--uc-inverted-colour) !important;

                    --arrowpanel-border-color:                  var(--uc-theme-colour)    !important;
                    --arrowpanel-border-radius:                 var(--uc-border-radius)   !important;
                    --arrowpanel-background:                    var(--uc-theme-colour)    !important;
                    --arrowpanel-color:                         var(--inverted-colour)    !important;

                    --autocomplete-popup-highlight-background:  var(--uc-inverted-colour) !important;
                    --autocomplete-popup-highlight-color:       var(--uc-inverted-colour) !important;
                    --autocomplete-popup-hover-background:      var(--uc-inverted-colour) !important;


                    --tab-block-margin: 2px !important;

                }

                window,
                #main-window,
                #toolbar-menubar,
                #TabsToolbar,
                #PersonalToolbar,
                #navigator-toolbox,
                #sidebar-box,
                #nav-bar {

                    -moz-appearance: none !important;

                    border: none !important;
                    box-shadow: none !important;
                    background: var(--uc-theme-colour) !important;

                }





                /* grey out ccons inside the toolbar to make it
                 * more aligned with the Black & White colour look */
                #PersonalToolbar toolbarbutton:not(:hover),
                #bookmarks-toolbar-button:not(:hover) { filter: grayscale(1) !important; }


                /* Show Window Control Button */
                .titlebar-buttonbox-container { display: -moz-inline-box !important; }


                /* remove "padding" left and right from tabs */
                .titlebar-spacer { display: none !important; }


                /* remove gap after pinned tabs */
        #tabbrowser-tabs[haspinnedtabs]:not([positionpinnedtabs])
                    > #tabbrowser-arrowscrollbox
                    > .tabbrowser-tab[first-visible-unpinned-tab] { margin-inline-start: 0 !important; }


                /* remove tab shadow */
                .tabbrowser-tab
                    >.tab-stack
                    > .tab-background { box-shadow: none !important;  }


                /* tab background */
                .tabbrowser-tab
                    > .tab-stack
                    > .tab-background { background: var(--uc-theme-colour) !important; }


                /* active tab background */
                .tabbrowser-tab[selected]
                    > .tab-stack
                    > .tab-background { background: var(--uc-hover-colour) !important; }


                /* tab close button options */
                .tabbrowser-tab:not([pinned]) .tab-close-button { display: var(--show-tab-close-button) !important; }
                .tabbrowser-tab:not([pinned]):hover .tab-close-button { display: var(--show-tab-close-button-hover) !important }


                /* adaptive tab width */
                .tabbrowser-tab[selected][fadein]:not([pinned]) { max-width: var(--uc-active-tab-width) !important; }
                .tabbrowser-tab[fadein]:not([selected]):not([pinned]) { max-width: var(--uc-inactive-tab-width) !important; }


                /* container tabs indicator */
                .tabbrowser-tab[usercontextid]
                    > .tab-stack
                    > .tab-background
                    > .tab-context-line {

                        margin: -1px var(--container-tabs-indicator-margin) 0 var(--container-tabs-indicator-margin) !important;

                        border-radius: var(--tab-border-radius) !important;

                }


                /* show favicon when media is playing but tab is hovered */
                .tab-icon-image:not([pinned]) { opacity: 1 !important; }


                /* Makes the speaker icon to always appear if the tab is playing (not only on hover) */
                .tab-icon-overlay:not([crashed]),
                .tab-icon-overlay[pinned][crashed][selected] {

                  top: 5px !important;
                  z-index: 1 !important;

                  padding: 1.5px !important;
                  inset-inline-end: -8px !important;
                  width: 16px !important; height: 16px !important;

                  border-radius: 10px !important;

                }


                /* style and position speaker icon */
                .tab-icon-overlay:not([sharing], [crashed]):is([soundplaying], [muted], [activemedia-blocked]) {

                  stroke: transparent !important;
                  background: transparent !important;
                  opacity: 1 !important; fill-opacity: 0.8 !important;

                  color: currentColor !important;

                  stroke: var(--uc-theme-colour) !important;
                  background-color: var(--uc-theme-colour) !important;

                }


                /* change the colours of the speaker icon on active tab to match tab colours */
                .tabbrowser-tab[selected] .tab-icon-overlay:not([sharing], [crashed]):is([soundplaying], [muted], [activemedia-blocked]) {

                  stroke: var(--uc-hover-colour) !important;
                  background-color: var(--uc-hover-colour) !important;

                }


                .tab-icon-overlay:not([pinned], [sharing], [crashed]):is([soundplaying], [muted], [activemedia-blocked]) { margin-inline-end: 9.5px !important; }


                .tabbrowser-tab:not([image]) .tab-icon-overlay:not([pinned], [sharing], [crashed]) {

                  top: 0 !important;

                  padding: 0 !important;
                  margin-inline-end: 5.5px !important;
                  inset-inline-end: 0 !important;

                }


                .tab-icon-overlay:not([crashed])[soundplaying]:hover,
                .tab-icon-overlay:not([crashed])[muted]:hover,
                .tab-icon-overlay:not([crashed])[activemedia-blocked]:hover {

                    color: currentColor !important;
                    stroke: var(--uc-inverted-colour) !important;
                    background-color: var(--uc-inverted-colour) !important;
                    fill-opacity: 0.95 !important;

                }


                .tabbrowser-tab[selected] .tab-icon-overlay:not([crashed])[soundplaying]:hover,
                .tabbrowser-tab[selected] .tab-icon-overlay:not([crashed])[muted]:hover,
                .tabbrowser-tab[selected] .tab-icon-overlay:not([crashed])[activemedia-blocked]:hover {

                    color: currentColor !important;
                    stroke: var(--uc-inverted-colour) !important;
                    background-color: var(--uc-inverted-colour) !important;
                    fill-opacity: 0.95 !important;

                }


                /* speaker icon colour fix */
        #TabsToolbar .tab-icon-overlay:not([crashed])[soundplaying],
        #TabsToolbar .tab-icon-overlay:not([crashed])[muted],
        #TabsToolbar .tab-icon-overlay:not([crashed])[activemedia-blocked] { color: var(--uc-inverted-colour) !important; }


                /* speaker icon colour fix on hover */
        #TabsToolbar .tab-icon-overlay:not([crashed])[soundplaying]:hover,
        #TabsToolbar .tab-icon-overlay:not([crashed])[muted]:hover,
        #TabsToolbar .tab-icon-overlay:not([crashed])[activemedia-blocked]:hover { color: var(--uc-theme-colour) !important; }





        #nav-bar {

                    border:     none !important;
                    box-shadow: none !important;
                    background: transparent !important;

                }


                /* remove border below whole nav */
        #navigator-toolbox { border-bottom: none !important; }


        #urlbar,
        #urlbar * { box-shadow: none !important; }


        #urlbar-background { border: var(--uc-hover-colour) !important; }


        #urlbar[focused="true"]
                    > #urlbar-background,
        #urlbar:not([open])
                    > #urlbar-background { background: transparent !important; }


        #urlbar[open]
                    > #urlbar-background { background: var(--uc-theme-colour) !important; }


                .urlbarView-row:hover
                    > .urlbarView-row-inner,
                .urlbarView-row[selected]
                    > .urlbarView-row-inner { background: var(--uc-hover-colour) !important; }





                /* transition to oneline */
                @media (min-width: 1000px) {


                    /* move tabs bar over */
                    #TabsToolbar { margin-left: var(--uc-urlbar-width) !important; }


                    /* move entire nav bar  */
                    #nav-bar { margin: calc((var(--urlbar-min-height) * -1) - 8px) calc(100vw - var(--uc-urlbar-width)) 0 0 !important; }


                } /* end media query */





                /* Container Tabs */
                .identity-color-blue      { --identity-tab-color: var(--uc-identity-color-blue)      !important; --identity-icon-color: var(--uc-identity-color-blue)      !important; }
                .identity-color-turquoise { --identity-tab-color: var(--uc-identity-color-turquoise) !important; --identity-icon-color: var(--uc-identity-color-turquoise) !important; }
                .identity-color-green     { --identity-tab-color: var(--uc-identity-color-green)     !important; --identity-icon-color: var(--uc-identity-color-green)     !important; }
                .identity-color-yellow    { --identity-tab-color: var(--uc-identity-color-yellow)    !important; --identity-icon-color: var(--uc-identity-color-yellow)    !important; }
                .identity-color-orange    { --identity-tab-color: var(--uc-identity-color-orange)    !important; --identity-icon-color: var(--uc-identity-color-orange)    !important; }
                .identity-color-red       { --identity-tab-color: var(--uc-identity-color-red)       !important; --identity-icon-color: var(--uc-identity-color-red)       !important; }
                .identity-color-pink      { --identity-tab-color: var(--uc-identity-color-pink)      !important; --identity-icon-color: var(--uc-identity-color-pink)      !important; }
                        .identity-color-purple    { --identity-tab-color: var(--uc-identity-color-purple)    !important; --identity-icon-color: var(--uc-identity-color-purple)    !important; }
      '';
    };
  };
}
