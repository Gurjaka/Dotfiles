{
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
}
