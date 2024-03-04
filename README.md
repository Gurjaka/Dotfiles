## Introduction
This is my Hyprland setup with sway as backend, following [Nord colorscheme](https://www.nordtheme.com).
Keep in mind, this config is designed for Archlinux system, it should work on any Arch based distro, but might work poorly on anything else. Use it at your own risk!
![Neofetch](Pictures/Screenshot1.png)
![Swaync](Pictures/Screenshot2.png)

### Auto installer for this dotfiles is still under development, so you will have to do everything manually.

# Table of contents
Set up login manager (Sddm) 

Install Hyprlandwm with Swaywm as backend 

Install Hyprlamdwm only 

Install Swaywm only 

# First step 
Make sure to clone my Dotfiles ```git clone https://github.com/Gurjaka/Dotfiles.git```.

# Sddm set up (login manager)
Required packages: 
```
   neovim (or any other text editor)
   sddm
   sddm-sugar-candy
```
After the installation is done run following commands:
```
   systemctl enable sddm
   cd /usr/share/sddm/themes/sugar-candy/
   sudo rm -r Backgrounds theme.conf
   sudo cp -rv ~/Dotfiles/Sddm/Backgrounds . && sudo cp -rv ~/Dotfiles/Sddm/theme.conf .
   cd && sudo nvim /usr/lib/sddm/sddm.conf.d/default.conf
```
Set ```[Theme] Current=sugar-candy```

# Set up Hyprlandwm, with Swaywm as backend
Make sure you have following packages installed:
```
   hyprland or hyprland-git (Stable or Unstable)
   sway or sway-git (Stable or Unstable)
   wlroots or wlroots-git (Stable or Unstable) (Depends on your Hyprland, and Sway Version)
   xorg-xwayland or xorg-xwayland-git (Stable or Unstable) (Depends on your Hyprland, and Sway version)
   xdg-desktop-portal-hyprland
   xdg-desktop-portal-gtk
   xdg-desktop-portal-wlr
   nordic-theme
   papirus-icon-theme
   paprius-nord
   paprius-folders
   ttf-jetbrains-mono
   ttf-font-awesome
   ttf-iosevka
   ttf-firacode
   nerd-fonts
   noto-fonts-emoji
   sddm
   nwg-look
   qt5ct
   kvantum
   gradience
   nautilus
   rofi-wayland
   alacritty
   imv
   mpv
   grim
   slurp
   wl-clipboard
   vivaldi or browser of your choice, can be modified in hyprland.conf
   swaync
   swww
   wlogout
   brightnessctl
   hypridle
   hyprlock
   polkit-gnome
   waybar
   network-manager-applet
   udiskie
   cava - optional
```

After installing everything, you can clone, and apply my config:
```
git clone https://github.com/Gurjaka/Dotfiles.git
cd ~/Dotfiles/HyprSwayDots/
cp -rv .config ~/
```
## Icon Theme:
In order to use nord icon theme you will have to run this command:
```paprius-folders -t Papirus-Dark -C polarnight4```

## Wallpaper
For wallpaper script to work, you will need to create "~/Pictures/wallpapers" directory, and put your wallpapers there.
Recommended [nord wallpapers](https://github.com/Gurjaka/Nord-Wallpapers)

## Theme rofi launcher
Run these commands to apply nord config for rofi launcher:
```
   mkdir -p ~/.local/share/rofi/themes/ && cp -rv ~/Dotfiles/HyprSwayDots/.config/rofi/themes/nord.rasi ~/.local/share/rofi/themes/
```
Press ```mainMod + D``` to execute rofi, search for rofi-theme-selector, and open it, search for nord, and apply using ```Alt + A```

# Note: 
In order to changes fully take effect, you might have to reboot your system.

You can modify setup as you like. Config files are located in $HOME/.config/hypr/

## Hyprland keybinds:

## Default Variables
```
$terminal = alacritty
$fileManager = nautilus
$menu = rofi -show drun
$editor = code --disable-gpu
$browser = vivaldi
$logout = wlogout --protocol layer-shell -b 6 -T
$NotificationCenter = swaync-client -t -sw
$wallpaper = ~/.config/hypr/scripts/WallpaperRandom.sh
$screenshot = grim -g "$(slurp -d)" - | wl-copy
```

# Keybindings
```
$mainMod = SUPER

# General keybinds
bind = $mainMod, Q, exec, $terminal
bind = $mainMod, C, exec, $editor
bind = $mainMod, B, exec, $browser
bind = $mainMod SHIFT, Q, killactive,  
bind = $mainMod, E, exec, $fileManager
bind = $mainMod, Tab, exec, $NotificationCenter
bind = $mainMod, F, fullscreen
bind = $mainMod, V, togglefloating, 
bind = $mainMod, D, exec, $menu
bind = $mainMod SHIFT, S, exec, $screenshot
bind = $mainMod ALT, W, exec, $wallpaper 
bind = $mainMod, Delete, exec, $logout
bind = $mainMod, P, pseudo,
bind = $mainMod, S, togglesplit,

# Vmware recieve keybinds
bind = $mainMod, I, submap, passthru
submap = passthru
bind = $mainMod, O, submap, reset
submap = reset

# Volume Contorl
binde=, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
bindl=, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-

# Brightness control
bind=,XF86MonBrightnessDown,exec,brightnessctl set 5%-
bind=,XF86MonBrightnessUp,exec,brightnessctl set +5%

# Move focus with mainMod + arrow keys
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

# Move active window
bind = $mainMod SHIFT, left, movewindow, l
bind = $mainMod SHIFT, up, movewindow, u
bind = $mainMod SHIFt, down, movewindow, d
bind = $mainMod SHIFt, right, movewindow, r

# Resize active window
bind = $mainMod ALT, right, resizeactive, 30 0
bind = $mainMod ALT, left, resizeactive, -30 0
bind = $mainMod ALT, up, resizeactive, 0 -30
bind = $mainMod ALT, down, resizeactive, 0 30

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

# Move active window to a workspace silently with mainMod + ALT + [0-9]
bind = $mainMod ALT, 1, movetoworkspacesilent, 1
bind = $mainMod ALT, 2, movetoworkspacesilent, 2
bind = $mainMod ALT, 3, movetoworkspacesilent, 3
bind = $mainMod ALT, 4, movetoworkspacesilent, 4
bind = $mainMod ALT, 5, movetoworkspacesilent, 5
bind = $mainMod ALT, 6, movetoworkspacesilent, 6
bind = $mainMod ALT, 7, movetoworkspacesilent, 7
bind = $mainMod ALT, 8, movetoworkspacesilent, 8
bind = $mainMod ALT, 9, movetoworkspacesilent, 9
bind = $mainMod ALT, 0, movetoworkspacesilent, 10

# Example special workspace (scratchpad)
bind = $mainMod, T, togglespecialworkspace, magic
bind = $mainMod SHIFT, T, movetoworkspace, special:magic

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow
```

## Sway config:
## Default variables: 
```
set $mod Mod4
set $term alacritty
set $browser vivaldi
set $filemanager nautilus
set $editor code --disable-gpu
set $screenshot grim -g "$(slurp -d)" - | wl-copy
set $wallpaper ~/.config/sway/scripts/WallpaperRandom.sh
set $menu rofi -show drun
set $wlogout wlogout --protocol layer-shell -b 6 -T
```
## Default keybindings: 
```
# Start a terminal
    bindsym $mod+q exec $term

    # Start your launcher
    bindsym $mod+d exec $menu

    # Start browser
    bindsym $mod+b exec $browser

    # Start filemanager
    bindsym $mod+e exec $filemanager

    # Start editor
    bindsym $mod+c exec $editor

    # Take screenshot
    bindsym $mod+Shift+s exec $screenshot

    # Kill focused window
    bindsym $mod+Shift+q kill

    # Wallpaper
    bindsym $mod+Alt+w exec $wallpaper

    # Sway notification center
    bindsym $mod+Tab exec swaync-client -t -sw

    # Start logout menu
    bindsym $mod+Delete exec $wlogout

    # Reload the configuration file
    bindsym $mod+Shift+c reload

    # Make the current focus fullscreen
    bindsym $mod+f fullscreen
    
    # Toggle the current focus between tiling and floating mode
    bindsym $mod+v floating toggle
    
    # Disable keybinds
    bindsym $mod+o mode "disable_keybinds" # Mod+Shift+c to reload

    # Touchpad gestures
    bindgesture swipe:right workspace prev
    bindgesture swipe:left workspace next

    floating_modifier $mod normal

    # Volume control
    bindsym --locked XF86AudioMute exec pactl set-sink-mute @DEFAULT_SINK@ toggle
    bindsym --locked XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5%
    bindsym --locked XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5%

    # Brightness control
    bindsym --locked XF86MonBrightnessDown exec brightnessctl set 5%- # Brightness up
    bindsym --locked XF86MonBrightnessUp exec brightnessctl set 5%+ # Brightness down

# Moving around:
    # Use $mod+[up|down|left|right]
    bindsym $mod+Left focus left
    bindsym $mod+Down focus down
    bindsym $mod+Up focus up
    bindsym $mod+Right focus right

    # Ditto, with arrow keys
    bindsym $mod+Shift+Left move left
    bindsym $mod+Shift+Down move down
    bindsym $mod+Shift+Up move up
    bindsym $mod+Shift+Right move right 

# Workspaces:
    # Switch to workspace
    bindsym $mod+1 workspace number 1
    bindsym $mod+2 workspace number 2
    bindsym $mod+3 workspace number 3
    bindsym $mod+4 workspace number 4
    bindsym $mod+5 workspace number 5
    bindsym $mod+6 workspace number 6
    bindsym $mod+7 workspace number 7
    bindsym $mod+8 workspace number 8
    bindsym $mod+9 workspace number 9
    bindsym $mod+0 workspace number 10
    # Move focused container to workspace
    bindsym $mod+Shift+1 move container to workspace number 1
    bindsym $mod+Shift+2 move container to workspace number 2
    bindsym $mod+Shift+3 move container to workspace number 3
    bindsym $mod+Shift+4 move container to workspace number 4
    bindsym $mod+Shift+5 move container to workspace number 5
    bindsym $mod+Shift+6 move container to workspace number 6
    bindsym $mod+Shift+7 move container to workspace number 7
    bindsym $mod+Shift+8 move container to workspace number 8
    bindsym $mod+Shift+9 move container to workspace number 9
    bindsym $mod+Shift+0 move container to workspace number 10

# Layout stuff:
    # Manual tiling
    bindsym $mod+w splith
    bindsym $mod+s splitv

    # Switch the current container between different layout styles
    bindsym $mod+j layout stacking
    bindsym $mod+k layout tabbed
    bindsym $mod+l layout toggle split

    # Swap focus between the tiling area and the floating area
    bindsym $mod+space focus mode_toggle
    

    # Move focus to the parent container
    bindsym $mod+a focus parent

# Scratchpad:
    # Move the currently focused window to the scratchpad
    bindsym $mod+Shift+t move scratchpad

    # Show the next scratchpad window or hide the focused scratchpad window.
    # If there are multiple scratchpad windows, this command cycles through them.
    bindsym $mod+t scratchpad show

# Resizing containers:

    bindsym $mod+Alt+Left resize shrink width 30px
    bindsym $mod+Alt+Down resize grow height 30px
    bindsym $mod+Alt+Up resize shrink height 30px
    bindsym $mod+Alt+Right resize grow width 30px
```

# Set up only Hyprlandwm
```
   hyprland or hyprland-git (Stable or Unstable)
   wlroots or wlroots-git (Stable or Unstable) (Depends on your Hyprland Version)
   xorg-xwayland or xorg-xwayland-git (Stable or Unstable) (Depends on your Hyprland version)
   xdg-desktop-portal-hyprland
   xdg-desktop-portal-gtk
   nordic-theme
   papirus-icon-theme
   paprius-nord
   paprius-folders
   ttf-jetbrains-mono
   ttf-font-awesome
   ttf-iosevka
   ttf-firacode
   nerd-fonts
   noto-fonts-emoji
   sddm
   nwg-look
   qt5ct
   kvantum
   gradience
   nautilus
   rofi-wayland
   alacritty
   imv
   mpv
   grim
   slurp
   wl-clipboard
   vivaldi or browser of your choice (can be modified in hyprland.conf)
   swaync
   swww
   wlogout
   brightnessctl
   hypridle
   hyprlock
   polkit-gnome
   waybar
   network-manager-applet
   udiskie
   cava - optional
```

After installing everything, you can clone, and apply my config:
```
git clone https://github.com/Gurjaka/Dotfiles.git
cd ~/Dotfiles/HyprDots/
cp -rv .config ~/
```

## Set up icon theme
To set up icon theme follow these steps

## Set up wallpaper
To set up wallpaper follow these steps

## Set up rofi theme
To set up rofi theme follow these steps

## Default hyprland keybinds
To check default hyprland keybinds click here

# Set up only Swaywm
```
   sway or sway-git (Stable or Unstable)
   wlroots or wlroots-git (Stable or Unstable) (Depends on your Sway, Version)
   xorg-xwayland or xorg-xwayland-git (Stable or Unstable) (Depends on your Sway, version)
   xdg-desktop-portal-gtk
   xdg-desktop-portal-wlr
   nordic-theme
   papirus-icon-theme
   paprius-nord
   paprius-folders
   ttf-jetbrains-mono
   ttf-font-awesome
   ttf-iosevka
   ttf-firacode
   nerd-fonts
   noto-fonts-emoji
   sddm
   nwg-look
   qt5ct
   kvantum
   gradience
   nautilus
   rofi-wayland
   alacritty
   imv
   mpv
   grim
   slurp
   wl-clipboard
   vivaldi or browser of your choice, can be modified in hyprland.conf
   swaync
   swww
   wlogout
   brightnessctl
   swayidle
   swaylock
   polkit-gnome
   waybar
   network-manager-applet
   udiskie
   cava - optional
```

After installing everything, you can clone, and apply my config:
```
git clone https://github.com/Gurjaka/Dotfiles.git
cd ~/Dotfiles/SwayDots/
cp -rv .config ~/
```

## Set up icon theme
To set up icon theme follow these steps

## Set up wallpaper
To set up wallpaper follow these steps

## Set up rofi theme
To set up rofi theme follow these steps

## Default Sway keybinds
To check default Sway keybinds click here

Enjoy your experience!
