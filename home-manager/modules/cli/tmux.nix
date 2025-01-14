{
  pkgs,
  shell,
  ...
}: {
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
      setw -g mode-keys vi
      set -sg escape-time 5
      set-option -g status-position top
      # Use Prefix + hjkl for pane navigation
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      bind -n C-h resize-pane -L 5
      bind -n C-j resize-pane -D 5
      bind -n C-k resize-pane -U 5
      bind -n C-l resize-pane -R 5
    '';
  };
}
