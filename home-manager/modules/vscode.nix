{ pkgs, ...}:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [ 
      arcticicestudio.nord-visual-studio-code
      bbenoist.nix
      ms-python.python
      ms-python.debugpy
      ms-python.pylint
      ms-python.vscode-pylance
      eamodio.gitlens
      donjayamanne.githistory
      vscode-icons-team.vscode-icons
      esbenp.prettier-vscode
      ms-vscode.live-server
      ms-vsliveshare.vsliveshare
    ];
    userSettings = {
      "workbench.colorTheme" = "Nord";
      "workbench.iconTheme" = "vscode-icons";
      "editor.fontSize" = 16;
      "editor.fontFamily" = "\"Monaspace Neon Medium\"";
      "workbench.sideBar.location" = "right";
      "editor.cursorSmoothCaretAnimation" = "on";
      "workbench.statusBar.visible" = false;
      "window.menuBarVisibility" = "toggle";
      "editor.tabSize" = 2;
    };
  };
}
