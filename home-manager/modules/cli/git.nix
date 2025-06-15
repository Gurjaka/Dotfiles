{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userEmail = "esartia.gurika@gmail.com";
    userName = "Gurjaka";
    ignores = [
      ".envrc"
      ".direnv/"
      "__pycache__/"
      "result/"
      ".ccls-cache/"
      "compile_commands.json"
      "xdg-shell-protocol.h"
    ];
  };
}
