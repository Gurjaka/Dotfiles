{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    settings = {
      mgr = {
        ratio = [2 4 3];
        sort_by = "alphabetical";
        show_symlink = true;
      };
      preview = {
        max_width = 2560;
        max_height = 1440;
      };
    };
  };
}
