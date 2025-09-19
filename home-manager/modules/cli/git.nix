{
  userEmail,
  userName,
  ...
}: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    userEmail = userEmail;
    userName = userName;
    ignores = [
      ".envrc"
      ".direnv/"
      "__pycache__/"
      "result/"
      ".cache/"
      ".ccls-cache/"
      "compile_commands.json"
      "xdg-shell-protocol.h"
    ];
  };
}
