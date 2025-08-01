{
  lib,
  config,
  ...
}: {
  programs.vivaldi = {
    enable = false;
    extensions = let
      id = {
        dark-reader = "eimadpbcbfnmbkopoojfekhnkhdbieeh";
        privacy-badger = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp";
        vimuim = "dbepggeogbaibhgnhhndojpepiihcmeb";
        duckduckgo-privacy-essentials = "bkdgflcldnnnapblkhphbgpggdiikppg";
        bitwarden = "nngceckbapebfimnlniiiahkandclblb";
        material-icons-for-github = "bggfcpfjbdkhfhfmkjpbhnkhnpjjeomc";
        ublock-origin-lite = "ddkjiahejlhfcafbddmgiahcphecmpfh";
      };
    in
      builtins.attrValues (builtins.mapAttrs (n: v: {id = v;}) id);
  };
  home.activation = lib.mkIf config.programs.vivaldi.enable {
    OverrideVivaldiPrefs = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
      export prefs=~/.config/vivaldi/Default/Preferences
      if [ -e "$prefs" ]; then
      	rm -f "$prefs"
      	cp ~/Dotfiles/home-manager/modules/desktop/vivaldi/Preferences "$prefs"
      fi
    '';
  };
}
