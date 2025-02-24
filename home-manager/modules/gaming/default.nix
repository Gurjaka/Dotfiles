{pkgs, ...}: {
  programs.mangohud = {
    enable = true;
    settings = {
      cpu_temp = true;
      gpu_temp = true;
    };
  };
  home.packages = with pkgs; [
    (lutris.override {
      extraPkgs = pkgs: [
        umu-launcher
        proton-ge-bin
      ];
    })
  ];
}
