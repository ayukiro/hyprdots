#!/bin/bash

get_icon() {
  status=$(playerctl status 2>/dev/null)
  case $status in
  "Playing")
    echo "play_arrow"
    ;;
  "Paused")
    echo "pause"
    ;;
  *)
    echo ""
    ;;
  esac
}

get_track() {
  status=$(playerctl status 2>/dev/null)
  if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then
    artist=$(playerctl metadata artist 2>/dev/null)
    title=$(playerctl metadata title 2>/dev/null)

    if [ -n "$artist" ] && [ -n "$title" ]; then
      echo "$artist - $title"
    else
      echo ""
    fi
  else
    echo ""
  fi
}

case $1 in
icon)
  get_icon
  ;;
track)
  get_track
  ;;
*)
  echo "Usage: $0 {icon|track}"
  exit 1
  ;;
esac
