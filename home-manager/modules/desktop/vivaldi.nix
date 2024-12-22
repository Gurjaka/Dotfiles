{
  programs.vivaldi = {
    enable = true;
    extensions =
      let
        dark-reader = "eimadpbcbfnmbkopoojfekhnkhdbieeh";
        ublock-origin = "cjpalhdlnbpafiamejdnhcphjbkeiagm";
        privacy-badger = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp";
        vimuim = "dbepggeogbaibhgnhhndojpepiihcmeb";
        duckduckgo-privacy-essentials = "bkdgflcldnnnapblkhphbgpggdiikppg";
        bitwarden = "nngceckbapebfimnlniiiahkandclblb";
        material-icons-for-github = "bggfcpfjbdkhfhfmkjpbhnkhnpjjeomc";
      in
      [
        { id = dark-reader; }
        { id = ublock-origin; }
        { id = privacy-badger; }
        { id = vimuim; }
        { id = duckduckgo-privacy-essentials; }
        { id = bitwarden; }
        { id = material-icons-for-github; }
      ];
  };
}
