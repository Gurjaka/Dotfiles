# 🎨 Setting Up Your Favorite Colorscheme

To integrate your preferred colorscheme into the system, follow these steps:

1. **📁 Add the colorscheme to `themes/default.nix`:**  
   - Open `themes/default.nix`.  
   - Add your colorscheme definition using the existing ones as reference.

2. **🖼️ Create NixOS logo for Qtile bar:**  
   - Go to: `home-manager/modules/desktop/qtile/src/assets/`.  
   - Recolor or create NixOS logo to match your theme.  
   - Use the predefined logos as examples for style and format.

3. **🌄 Set up wallpapers:**  
   - Add wallpaper inputs in `flake.nix`.  
     (Refer to the predefined examples and use my repos as your reference.)  
   - Symlink the wallpapers in `home-manager/modules/theme/wallpapers.nix`.

> ⚠️ **Tip:** Consistency is key. Follow the existing structure and naming conventions for everything to work seamlessly.
