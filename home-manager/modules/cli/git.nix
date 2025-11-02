{
  userEmail,
  userName,
  ...
}: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user = {
        email = userEmail;
        name = userName;
      };
    };
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
