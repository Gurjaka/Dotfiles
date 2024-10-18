{ pkgs, shell, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.${shell}}/bin/${shell}";
    terminal = "tmux-256color";
    prefix = "C-a";
    keyMode = "vi";
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.nord;
        extraConfig = "set -g @plugin 'nord/tmux'";
      }
    ];
    extraConfig = ''
      set-option -g status-position top
    '';
  };
}
