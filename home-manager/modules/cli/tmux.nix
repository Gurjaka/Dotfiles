{
  pkgs,
  shell,
  selectedTheme,
  ...
}: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.${shell}}/bin/${shell}";
    terminal = "tmux-256color";
    prefix = "C-a";
    keyMode = "vi";

    extraConfig = ''
      setw -g mode-keys vi
      set -sg escape-time 5

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind -n C-h resize-pane -L 5
      bind -n C-l resize-pane -R 5
      bind -n C-j resize-pane -D 5
      bind -n C-k resize-pane -U 5

      set-option -g status-position top
      set -g status-style bg=${selectedTheme.base01}
      set -g status-left-length 200
      set -g status-right-length 200
      set -g window-status-separator ""

      set -g status-left ""

      set -g status-right "#[fg=${selectedTheme.base15},bg=${selectedTheme.base02}]#[fg=${selectedTheme.base00},bg=${selectedTheme.base15}] #[fg=${selectedTheme.base08},bg=${selectedTheme.base00}]#[fg=${selectedTheme.base05},bg=${selectedTheme.base00}] #(echo \"#{pane_current_path}\" | awk -F/ '{ if (NF<=2) print \$NF; else print \$(NF-1)\"/\"\$NF; }') #[fg=${selectedTheme.base00},bg=${selectedTheme.base02}] #[fg=${selectedTheme.base08},bg=${selectedTheme.base02}]#[fg=${selectedTheme.base00},bg=${selectedTheme.base08}] #[fg=${selectedTheme.base08},bg=${selectedTheme.base00}]#[fg=${selectedTheme.base05},bg=${selectedTheme.base00}] #S#[fg=${selectedTheme.base00},bg=${selectedTheme.base02}]"

      set -g window-status-format "#[fg=${selectedTheme.base05},bg=${selectedTheme.base02}] #W #[fg=${selectedTheme.base05},bg=${selectedTheme.base03}] #I#[fg=${selectedTheme.base03},bg=${selectedTheme.base02}]"
      set -g window-status-current-format "#[fg=${selectedTheme.base05},bg=${selectedTheme.base02}] #W #[fg=${selectedTheme.base00},bg=${selectedTheme.base08}] #I#[fg=${selectedTheme.base08},bg=${selectedTheme.base02}]"

      set -g 'status-format[1]' ""
      set -g status 2

      set -g pane-border-style fg=${selectedTheme.base03}
      set -g pane-active-border-style fg=${selectedTheme.base08}

      set -sa terminal-features ",alacritty:RGB"
      set -sa terminal-overrides ",alacritty:RGB"
      set -as terminal-overrides ",*:Tc"
    '';
  };
}
