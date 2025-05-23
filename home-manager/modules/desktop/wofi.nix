{selectedTheme, ...}: {
  programs.wofi = {
    enable = false;
    settings = {
      mode = "drun";
      allow_images = true;
      image_size = 28;
      width = 520;
      height = 380;
    };
    style = ''
      * {
        font-family: JetBrainsMono Nerd Font;
      }

      window {
        background-color: ${selectedTheme.base02};
        border-radius: 0px;
      }

      #input {
        margin: 5px;
        border-radius: 0px;
        border: none;
        background-color: ${selectedTheme.base02};
        color: white;
      }

      #inner-box {
        background-color: #383C4A;
      }

      #outer-box {
        margin: 2px;
        padding: 10px;
        background-color: #383C4A;
      }

      #scroll {
        margin: 5px;
      }

      #text {
        padding: 4px;
        color: white;
      }

      #entry:nth-child(even){
        background-color: #404552;
      }

      #entry:selected {
        background-color: ${selectedTheme.base10};
      }

      #text:selected {
        background: transparent;
      }

      image {
        background: transparent;
        margin-left: .25em;
        margin-right: .25em;
      }
    '';
  };
}
