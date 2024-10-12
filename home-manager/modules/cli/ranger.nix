{
  programs.ranger = {
    enable = true;
    plugins = [
      {
        name = "zoxide";
        src = builtins.fetchGit {
          url = "https://github.com/jchook/ranger-zoxide.git";
          rev = "363df97af34c96ea873c5b13b035413f56b12ead";
        };
      }
    ];
    settings = {
      preview_images = true;
      preview_images_method = "sixel";
    };
  };
}
