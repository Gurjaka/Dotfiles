# Qtile Window Manager 🪟⚡

This is the heart of my keyboard-driven workflow: **Qtile**, a dynamic tiling window manager written in Python 🐍 — customized heavily to work perfectly with Wayland 🚀 and my NixOS setup ❄️.

---

## 🛠️ Why Qtile?

- **Python-powered** 🐍: Easy to extend and customize exactly how I want.  
- **Wayland backend** 🚀: Experimental but modern, providing smooth rendering, security 🔒, and better input handling.  
- **Keyboard-centric** ⌨️: Everything can be controlled without touching the mouse 🖱️ — speed and focus all the way.  
- **Dynamic tiling** 🧩: Windows automatically arranged for maximum efficiency.

---

## ⚙️ Key Config Details

### Mod Key & Core Apps 🔑  
- `mod4` (Super/Windows key) as the main modifier.  
- Terminal: Wayland uses `footclient` 🦶; X11 falls back to `kitty` 🐱.  
- Browser: `librewolf` 🦊 — privacy-focused and open source.  
- Launcher: `rofi -show drun` 🚀 for app launching.  
- File manager: `thunar` 📁.  
- Editor: `nvim` inside terminal ✍️.  
- Notification center: `swaync-client` 🔔.

### Autostart Hooks 🔥

On startup, the config launches essential services and utilities to keep the system smooth and ready:

- 🎧 `systemctl --user restart pipewire` — Audio server for sound management  
- 🔵 `blueman-applet` — Bluetooth tray applet for easy device control  
- 💾 `udiskie` — Automatic mounting for removable drives  
- 📸 `flameshot` — Screenshot tool ready to capture on demand  
- 🎯 `focus-mode` — Custom script to minimize distractions and enhance productivity  
- 📊 `conky -c ~/.config/conky/conky-qtile.conf` — System monitor with stats and info displayed

**If running on Wayland:**

- 🦶 `foot --server` — Start Foot terminal server for Wayland native terminal  
- 🖼️ `swww-daemon` — Wallpaper daemon to manage backgrounds smoothly  
- 🎨 `wallrandom` — Script to randomize wallpapers on startup  

**If host is desktop:**

- 🦊 `librewolf` — Launch privacy-focused browser  
- 🎮 `discord --disable-gpu` — Start Discord with GPU acceleration disabled for stability  

### Fullscreen Rules 🎬  
Certain apps like `flameshot` 📸 automatically open fullscreen to avoid interruptions.

---

## ⌨️ Keybindings Breakdown

- Navigation: `mod + h/j/k/l` 🔀 to move focus left/down/up/right.  
- Window shuffle: `mod + shift + h/j/k/l` 🔄 moves windows around.  
- Resize: `mod + ctrl + j/k` 📏 to shrink or grow windows.  
- Toggle fullscreen: `mod + f` 🖥️.  
- Toggle floating: `mod + shift + space` 🌊.  
- Spawn terminal, browser, launcher, file manager, editor, color picker 🎨, screenshot tool 📸, and notification center 🔔 with easy combos.  
- Volume 🔊, brightness 🌞, media 🎵 keys mapped for quick control.  
- Special `mod + m` toggles Do Not Disturb mode 🚫🔔 via a custom function.

---

## 🗂️ Groups & Workspaces

- Numeric groups `0-9` 🔢 plus a scratchpad with dropdowns for Spotify 🎧 and terminal 🦶.  
- Specific matching rules send apps to designated groups automatically:  
  - Browsers (Firefox, Librewolf, Vivaldi) 🌐 go to group 2.  
  - Obsidian notes app 📝 to group 4.  
  - Discord 🎮 to group 9.  
  - Steam 🎲 to group 0.

- Keybindings let you switch groups 🔀 or move windows ↔️ between them.

---

## 🖥️ Layouts

- Using mostly **MonadTall** 🏢 for tiling — clean and efficient vertical stacking.  
- Other layouts like Columns 🟦, Max 🔲, Stack 🗂️, Bsp 🌿, etc. are commented out but ready to be enabled.

---

## 📊 Widgets & Bar

- Stylish powerline decorations ⚡ with custom colors matching my theme 🎨.  
- Shows current group, layout, window name 🪟, search box 🔍, system tray 🛎️, memory 🧠, battery 🔋, volume 🔉, keyboard layout ⌨️, and clock ⏰.  
- Responsive to laptop 💻 vs desktop 🖥️ (some widgets get removed on laptop).  
- Interactive logos and click callbacks (e.g., open NixOS Wiki 📚 on logo click).

---

## 🖱️ Mouse Controls

- Drag floating windows with `mod + left-click` 🖱️ or resize with `mod + right-click` ↔️.  
- Bring window to front with `mod + middle-click` 🔝.

---

## 🔧 Additional Config

- Wayland input settings tuned for flat acceleration profiles ⚙️.  
- Custom cursor theme `Nordzy-cursors` 🖱️.  
- `wmname` set to `QTILE` for Java UI compatibility ☕.

---
