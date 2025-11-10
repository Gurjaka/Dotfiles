{pkgs}:
pkgs.writeShellScriptBin "mpd-notify" ''
  set -euo pipefail

  TMP_DIR="$HOME/.cache/mpd-covers"
  mkdir -p "$TMP_DIR"
  SYNC_KEY="mpd-now-playing"

  playerctl --player=mpd metadata --follow \
    --format '{{xesam:artist}}|{{xesam:title}}|{{xesam:album}}|{{mpris:artUrl}}|{{mpris:length}}' |
  while IFS='|' read -r artist title album art length_ns; do
      [[ ''${art:-} == file://* ]] && art="''${art#file://}"
      src_icon="''${art:-/usr/share/icons/hicolor/128x128/apps/mpd.png}"

      dest_icon="$TMP_DIR/$(basename "''${src_icon%.*}")-circle.png"

      # If cover exists, create a circular mask
      if [ -f "$src_icon" ]; then
          ${pkgs.imagemagick}/bin/convert "$src_icon" \
              -resize 128x128^ \
              -gravity center \
              -extent 128x128 \
              \( -size 128x128 xc:none -fill white -draw "circle 64,64 64,1" \) \
              -compose copyopacity -composite \
              "$dest_icon" 2>/dev/null || dest_icon="$src_icon"
      else
          dest_icon="$src_icon"
      fi

      # Compute times and progress bar
      len_s=$(( (''${length_ns:-0}) / 1000000 / 1000 ))
      pos_s=$(playerctl --player=mpd position 2>/dev/null || echo 0)
      pos_s=''${pos_s%.*}

      width=16
      filled=$(( len_s > 0 ? pos_s * width / len_s : 0 ))
      [ "$filled" -gt "$width" ] && filled=$width
      bar="$(printf '%0.s█' $(seq 1 $filled))$(printf '%0.s─' $(seq $((filled+1)) $width))"

      fmt_time() { printf "%02d:%02d" $(( $1 / 60 )) $(( $1 % 60 )); }

      summary=" ''${title:-Unknown Title} — ''${artist:-Unknown Artist}"
      body=" ''${album:-Unknown Album}\n ''${bar}  $(fmt_time "$pos_s") / $(fmt_time "$len_s")"

      notify-send -a "MPD" -i "$dest_icon" \
        --hint="string:x-canonical-private-synchronous:''${SYNC_KEY}" \
        --urgency=low --expire-time=6000 \
        "$summary" "$body"
      sleep 0.3
  done
''
