{
  pkgs,
  lib,
  ...
}: {
  home.packages = [
    pkgs.tmux-sessionizer
  ];

  home.activation.applyTmsConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
    if [ -x "${pkgs.tmux-sessionizer}/bin/tms" ]; then
    	echo "Rebuilding tms config..."
    	${pkgs.tmux-sessionizer}/bin/tms config --full-path true --paths ~/ --excluded ~/.*/
    fi
  '';
}
