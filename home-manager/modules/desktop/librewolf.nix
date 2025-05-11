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
      "browser.display.use_document_fonts" = 0;
      "font.name.monospace.x-western" = "JetBrains Mono Nerd Font Medium";
      "font.name.sans-serif.x-western" = "JetBrains Mono Nerd Font Medium";
      "font.name.serif.x-western" = "JetBrains Mono Nerd Font Medium";
      "browser.display.document_color_use" = 0;
      "browser.toolbars.bookmarks.visibility" = "never";
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      "svg.context-properties.content.enabled" = true;
      "browser.startup.page" = 3;
      "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "webgl.disabled" = false;
      "privacy.resistFingerprinting" = false;
      "general.autoScroll" = true;
    };
    profiles.${user} = {
      isDefault = true;
      userChrome = ''
        :root {

            /*---+---+---+---+---+---+---+
             | C | O | L | O | U | R | S |
             +---+---+---+---+---+---+---*/

            /* Nord Theme Colors */
            --window-colour:               #2E3440; /* Nord0 */
            --secondary-colour:            #3B4252; /* Nord1 */
            --inverted-colour:             #D8DEE9; /* Nord4 */

            /* Container Tab Colours (Nord approximations) */
            --uc-identity-color-blue:      #81A1C1; /* Nord10 */
            --uc-identity-color-turquoise: #8FBCBB; /* Nord7 */
            --uc-identity-color-green:     #A3BE8C; /* Nord14 */
            --uc-identity-color-yellow:    #EBCB8B; /* Nord13 */
            --uc-identity-color-orange:    #D08770; /* Nord12 */
            --uc-identity-color-red:       #BF616A; /* Nord11 */
            --uc-identity-color-pink:      #B48EAD; /* Nord15 */
            --uc-identity-color-purple:    #5E81AC; /* Nord9 */

            /* URL colour in URL bar suggestions */
            --urlbar-popup-url-color: var(--uc-identity-color-purple) !important;

            /* global border radius */
            --uc-border-radius: 0;

            /* dynamic url bar width settings */
            --uc-urlbar-width: clamp(250px, 50vw, 600px);

            /* dynamic tab width settings */
            --uc-active-tab-width:   clamp( 50px, 18vw, 220px);
            --uc-inactive-tab-width: clamp( 50px, 15vw, 200px);

            /* if active always shows the tab close button */
            --show-tab-close-button: none;

            /* if active only shows the tab close button on hover */
            --show-tab-close-button-hover: -moz-inline-box;

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
