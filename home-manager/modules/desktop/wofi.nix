{
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
        font-family: Fira Code Medium;
      }

      window {
        background-color: #3B4252;
        border-radius: 0px;
      }

      #input {
        margin: 5px;
        border-radius: 0px;
        border: none;
        background-color: #3B4252;
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
        background-color: #5e81ac;
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
