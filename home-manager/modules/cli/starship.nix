{ shell, ... }:

{
  programs.starship = {
    enable = if shell != "zsh" then true else false;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      line_break.disabled = true;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };
}
