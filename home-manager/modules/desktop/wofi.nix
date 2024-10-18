{ theme, ... }:

{
  programs.wofi = {
    enable = true;
    settings = {
      mode = "drun";
      allow_images = true;
      image_size = 28;
      width = 520;
      height = 380;
    };
    style = if theme == "nord" then ''
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
    ''
    else if theme == "everforest" then ''
      * {
        font-family: Fira Code Medium;
      }

      window {
        background-color: #323D43FF;
        border-radius: 12px;
      }

      #input {
        margin: 5px;
        border-radius: 0px;
        border: none;
        background-color: #3C474DFF;
        color: white;
      }

      #inner-box {
        background-color: #343F44;
      }

      #outer-box {
        margin: 2px;
        padding: 10px;
        background-color: #343F44;
      }

      #scroll {
        margin: 5px;
      }

      #text {
        padding: 4px;
        color: white;
      }

      #entry:nth-child(even){
        background-color: #2D353B;
      }

      #entry:selected {
        background-color: #7FBBB3;
      }

      #text:selected {
        background: transparent;
      }

      image {
        background: transparent;
        margin-left: .25em;
        margin-right: .25em;
      }     
    ''
    else {};
  };
}
