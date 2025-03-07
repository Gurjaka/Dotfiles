{lib, ...}: {
  wayland.windowManager.sway = let
    mod = "mod4";
  in {
    enable = true;
    wrapperFeatures.gtk = true;
    xwayland = true;
    systemd.enable = false;
    extraConfig = ''
      set $term footclient
      set $left h
      set $down j
      set $up k
      set $right l
      set $browser librewolf
      set $launcher rofi -show drun
      set $fileManager thunar
      set $editor $term -e nvim
      set $ntCenter swaync-client -t -sw
    '';
    config = {
      defaultWorkspace = "workspace number 1";
      focus.newWindow = "focus";
      floating.modifier = mod;
      startup = [
        {command = "foot --server";}
        {command = "swaync";}
        {command = "udiskie";}
        {command = "flameshot";}
      ];
      # output = {
      #   "*" = {
      #     bg = "/home/${user}/.config/wallpapers/outer_space.jpg fill";
      #   };
      # };
      input = {
        "type:keyboard" = {
          xkb_layout = "us,ge";
          xkb_variant = "dvorak,";
          xkb_options = "grp:alt_shift_toggle,caps:escape";
        };
      };
      keybindings = let
        keybind = builtins.mapAttrs (key: cmd: {"${mod}+${key}" = "${cmd}";}) {
          # General Keybinds
          "Return" = "exec $term";
          "Shift+q" = "kill";
          "d" = "exec $launcher";
          "Shift+c" = "reload";
          "Ctrl+q" = "exec swaymsg exit";

          # Navigation keybinds
          "left" = "focus left";
          "right" = "focus right";
          "up" = "focus up";
          "down" = "focus down";

          "Shift+left" = "move left";
          "Shift+down" = "move down";
          "Shift+up" = "move up";
          "Shift+right" = "move right";
        };

        # Workspaces
        ws = map toString (lib.range 1 9);
        workspaceBindings =
          lib.concatMap (i: [
            {
              name = "${mod}+${i}";
              value = "workspace number ${i}";
            }
            {
              name = "${mod}+Shift+${i}";
              value = "move container to workspace number ${i}";
            }
          ])
          ws;

        workspaces =
          {
            "${mod}+0" = "workspace number 10";
            "${mod}+Shift+0" = "move container to workspace number 10";
          }
          // builtins.listToAttrs workspaceBindings;
      in
        workspaces // lib.lists.foldr (a: b: a // b) {} (builtins.attrValues keybind);
      bars = [
        {
          position = "top";
          statusCommand = "while date +'%Y-%m-%d %X'; do sleep 1; done";
        }
      ];
    };
  };
}
