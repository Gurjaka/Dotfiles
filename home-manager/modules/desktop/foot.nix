{ theme, ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        # term = "xterm-256color";

        font = "Fira Code Nerd Font:style=Medium:size=12";
        
        pad="20x20";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      colors = if theme == "nord" then {
        foreground = "d8dee9";
        background = "2e3440";
       
        selection-foreground = "d8dee9";
        selection-background = "4c566a";

        regular0 = "3b4252";
        regular1 = "bf616a";
        regular2 = "a3be8c";
        regular3 = "ebcb8b";
        regular4 = "81a1c1";
        regular5 = "b48ead";
        regular6 = "88c0d0";
        regular7 = "e5e9f0";

        bright0 = "4c566a";
        bright1 = "bf616a";
        bright2 = "a3be8c";
        bright3 = "ebcb8b";
        bright4 = "81a1c1";
        bright5 = "b48ead";
        bright6 = "8fbcbb";
        bright7 = "eceff4";

        dim0 = "373e4d";
        dim1 = "94545d";
        dim2 = "809575";
        dim3 = "b29e75";
        dim4 = "68809a";
        dim5 = "8c738c";
        dim6 = "6d96a5";
        dim7 = "aeb3bb";
      }
      else if theme == "everforest" then {
        background = "2f383e";
        foreground = "d3c6aa";

        regular0 = "4b565c"; 
        regular1 = "e67e80"; 
        regular2 = "a7c080"; 
        regular3 = "dbbc7f"; 
        regular4 = "7fbbb3"; 
        regular5 = "d699b6"; 
        regular6 = "83c092"; 
        regular7 = "d3c6aa"; 

        bright0 = "4b565c"; 
        bright1 = "e67e80";
        bright2 = "a7c080";
        bright3 = "dbbc7f";
        bright4 = "7fbbb3";
        bright5 = "d699b6";
        bright6 = "83c092";
        bright7 = "d3c6aa";
      }
      else {};
    };
  };
}
