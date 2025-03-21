{lib, ...}: {
  programs.vivaldi = {
    enable = true;
    extensions = let
      id = {
        dark-reader = "eimadpbcbfnmbkopoojfekhnkhdbieeh";
        privacy-badger = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp";
        vimuim = "dbepggeogbaibhgnhhndojpepiihcmeb";
        duckduckgo-privacy-essentials = "bkdgflcldnnnapblkhphbgpggdiikppg";
        bitwarden = "nngceckbapebfimnlniiiahkandclblb";
        material-icons-for-github = "bggfcpfjbdkhfhfmkjpbhnkhnpjjeomc";
      };
    in
      builtins.attrValues (builtins.mapAttrs (n: v: {id = v;}) id);
  };
  # home.file.".config/vivaldi/Default/Preferences".source = ./Preferences;
  home.activation.OverridePrefs = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
    export prefs=~/.config/vivaldi/Default/Preferences
    if [ -e "$prefs" ]; then
    	rm -f "$prefs"
    	cp ~/Dotfiles/home-manager/modules/desktop/vivaldi/Preferences "$prefs"
    fi
  '';
}
