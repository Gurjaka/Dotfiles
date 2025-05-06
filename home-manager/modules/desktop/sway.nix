{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    swaybg
    swayidle
    swaylock-effects
  ];
  wayland.windowManager.sway = let
    mod = "mod4";
  in {
    enable = true;
    wrapperFeatures.gtk = true;
    xwayland = true;
    systemd.enable = false;
    extraConfig = ''
      set $term footclient
      set $browser firefox
      set $launcher rofi -show drun
      set $fileManager thunar
      set $editor $term -e nvim
      set $ntCenter swaync-client -t -sw

      assign [app_id="Navigator"] workspace 2
      assign [app_id="vivaldi-stable"] workspace 2
      assign [app_id="librewolf"] workspace 2
      assign [app_id="brave-browser"] workspace 2
      assign [app_id="discord"] workspace 9
    '';
    config = {
      defaultWorkspace = "workspace number 1";
      focus.newWindow = "focus";
      startup = [
        {command = "foot --server";}
        {command = "swaync";}
        {command = "udiskie";}
        {command = "flameshot";}
        {command = "discord";}
        {command = "$browser";}
        {command = "swaybg -i .config/wallpapers/outer_space.jpg";}
      ];
      input = {
        "type:pointer" = {
          accel_profile = "flat";
          tap = "enabled";
        };
        "type:keyboard" = {
          xkb_layout = "us,ge";
          # xkb_variant = "dvorak";
          xkb_options = "caps:escape,grp:alt_shift_toggle";
        };
      };
      window = {
        border = 2;
        titlebar = false;
      };
      gaps = {
        inner = 5;
        outer = 2;
      };
      floating = {
        border = 2;
        titlebar = false;
        modifier = mod;
      };
      colors = {
        focused = {
          background = "#3B4252";
          border = "#5E81AC";
          childBorder = "#5E81AC";
          indicator = "#88C0D0";
          text = "#D8DEE9";
        };
        unfocused = {
          background = "#2E3440";
          border = "#4C566A";
          childBorder = "#4C566A";
          indicator = "#81A1C1";
          text = "#D8DEE9";
        };
      };
      modes = {
        vm_mode = {
          "${mod}+i" = "mode \"default\"";
        };
      };
      keybindings = let
        unpack = set: lib.lists.foldr (a: b: a // b) {} (builtins.attrValues set);

        mod4_keybinds = unpack (builtins.mapAttrs (key: cmd: {"${mod}+${key}" = "${cmd}";}) {
          # General Keybinds
          "Ctrl+r" = "reload";
          "Shift+q" = "kill";
          "i" = "mode \"vm_mode\"";

          # Executables
          "Tab" = "exec $ntCenter";
          "Ctrl+q" = "exec swaymsg exit";
          "Return" = "exec $term";
          "Shift+s" = "exec flameshot gui -c";
          "d" = "exec $launcher";
          "p" = "exec wl-color-picker";
          "c" = "exec $editor";
          "b" = "exec $browser";
          "e" = "exec $fileManager";

          # Splits
          "w" = "splith";
          "v" = "splitv";

          # Layout stuff
          "f" = "fullscreen";
          "Shift+space" = "floating toggle";
          "space" = "focus mode_toggle";
          "a" = "focus parent";
          "Shift+Return" = "layout toggle split";

          # Navigation keybinds
          "h" = "focus left";
          "l" = "focus right";
          "k" = "focus up";
          "j" = "focus down";

          "Shift+h" = "move left";
          "Shift+l" = "move down";
          "Shift+k" = "move up";
          "Shift+j" = "move right";

          # Resizing keybinds
          "Ctrl+h" = "resize shrink width 50px";
          "Ctrl+k" = "resize grow height 50px";
          "Ctrl+j" = "resize shrink height 50px";
          "Ctrl+l" = "resize grow width 50px";
        });

        general_keybinds = unpack (builtins.mapAttrs (key: cmd: {"${key}" = "exec ${cmd}";}) {
          # Brightness controls
          "XF86MonBrightnessDown" = "brightnessctl set 5%-";
          "XF86MonBrightnessUp" = "brightnessctl set +5%";

          # Audio controls
          "XF86AudioLowerVolume" = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-";
          "XF86AudioRaiseVolume" = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+";
          "XF86AudioMute" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

          # Playerctl
          "XF86AudioPlay" = "playerctl play-pause";
          "XF86AudioPrev" = "playerctl previous";
          "XF86AudioNext" = "playerctl next";
        });

        keybinds = mod4_keybinds // general_keybinds;

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
        workspaces // keybinds;
      bars = [
        {
          position = "top";
          statusCommand = "while date +'%Y-%m-%d %X'; do sleep 1; done";
        }
      ];
    };
  };
}
