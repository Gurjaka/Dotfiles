{
  pkgs,
  shell,
  ...
}: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.${shell}}/bin/${shell}";
    terminal = "tmux-256color";
    prefix = "C-a"; # Prefix key for tmux commands
    keyMode = "vi"; # Use vi keybindings for navigation
    extraConfig = ''
      # General tmux settings
      setw -g mode-keys vi
      set -sg escape-time 5

      # Use Prefix + hjkl for pane navigation
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Resize panes using Ctrl + hjkl
      bind -n C-h resize-pane -L 5
      bind -n C-l resize-pane -R 5
      bind -n C-j resize-pane -D 5
      bind -n C-k resize-pane -U 5

      # Status Bar Configuration
      set-option -g status-position top  # Position status bar at the top
      set -g status-style bg=default
      set -g status-left-length 200
      set -g status-right-length 200
      set -g window-status-separator ""

      # Disable session name on the left side
      set -g status-left ""  # No session name

      # Status right with session name and current working directory
      set -g status-right "#[fg=colour5,bg=default]#[fg=colour0,bg=colour5] #[fg=colour14,bg=colour0]#[fg=colour15,bg=colour0] #(echo \"#{pane_current_path}\" | awk -F/ '{ if (NF<=2) print \$NF; else print \$(NF-1)\"/\"\$NF; }') #[fg=colour0,bg=default] #[fg=colour14,bg=default]#[fg=colour0,bg=colour14] #[fg=colour14,bg=colour0]#[fg=colour15,bg=colour0] #S#[fg=colour0,bg=default]"
      # Window Status Formatting
      set -g window-status-format "#[fg=colour15,bg=default] #W #[fg=colour15,bg=colour8] #I#[fg=colour8,bg=default]"
      set -g window-status-current-format "#[fg=colour15,bg=default] #W #[fg=colour0,bg=colour12] #I#[fg=colour12,bg=default]"

      # Add gap between bar and content
      set -g 'status-format[1]' ""
      set -g status 2  # Status updates every 2 seconds

      set -g pane-border-style fg=colour8   # Inactive pane border color (dark grey)
      set -g pane-active-border-style fg=colour12  # Active pane border color (light blue, or any other color)

      set -sa terminal-features ",alacritty:RGB"
      set -sa terminal-overrides ",alacritty:RGB"
      set -as terminal-overrides ",*:Tc"
    '';
  };
}
