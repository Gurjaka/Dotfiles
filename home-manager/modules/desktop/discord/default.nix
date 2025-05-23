{
  pkgs,
  colorscheme,
  ...
}: {
  imports = [./settings.nix];
  home.packages = [
    (pkgs.discord.override {
      withVencord = true;
    })
  ];
  xdg.configFile."Vencord/themes/nord.css".text = let
    extraCss = builtins.readFile ./${colorscheme}.css;
  in ''
    	@import url('https://refact0r.github.io/midnight-discord/build/midnight.css');

    	body {
    			--font: 'figtree';

    			--gap: 12px;
    			--divider-thickness: 4px;

    			--animations: on;
    			--list-item-transition: 0.2s ease;
    			--dms-icon-svg-transition: 0.4s ease;

    			--move-top-bar-buttons: off;
    			--custom-app-top-bar-height: 32px;

    			--custom-window-controls: on;
    			--window-control-size: 14px;

    			--dms-icon: on;
    			--dms-icon-svg-url: url('https://upload.wikimedia.org/wikipedia/commons/c/c4/Font_Awesome_5_solid_moon.svg');
    			--dms-icon-svg-size: 90%;
    			--dms-icon-color-before: var(--icon-secondary);
    			--dms-icon-color-after: var(--white);

    			--dms-background: off;
    			--dms-background-image-url: url("");
    			--dms-background-image-size: cover;
    			--dms-background-color: linear-gradient(70deg, var(--blue-2), var(--purple-2), var(--red-2));

    			--background-image: off;
    			--background-image-url: url("");

    			--transparency-tweaks: off;
    			--remove-bg-layer: off;
    			--panel-blur: off;
    			--blur-amount: 12px;
    			--bg-floating: var(--bg-3);

    			--flipped-chatbar: on;
    			--chatbar-height: 47px;
    			--chatbar-padding: 8px;

    			--small-user-panel: off;
    	}
    ${extraCss}
  '';
}
