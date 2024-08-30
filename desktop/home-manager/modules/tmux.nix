{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
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
