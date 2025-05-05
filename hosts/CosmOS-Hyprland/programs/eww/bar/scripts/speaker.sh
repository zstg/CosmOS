#!/bin/sh

case $1 in
      "*") command="" ;;
      "up") command="set-volume 55 1%+ --limit=100" ;;
      "down") command="set-volume 55 1%- --limit=100" ;;
      "toggle") command="set-mute 55 toggle" ;;
esac

[ -n "$command" ] && wpctl $command 
# mute=$(pamixer --get-mute)
mute=`wpctl get-volume 55 | awk '{printf $3}' | tr -d '[]'`
if [ "$mute" = "MUTED" ]; then
      volume="muted"
      icon=""
else 
      volume="$(wpctl get-volume 55 | awk '{printf $2}')"
      volume=$((volume*100))
      if [ "$volume" -gt 66 ]; then
            icon=""
      elif [ "$volume" -gt 33 ]; then
            icon=""
      elif [ "$volume" -gt 00 ]; then 
            icon=""
      else 
            icon=""
      fi
      volume="$volume%"
fi

echo "{\"content\": \"$volume\", \"icon\": \"$icon\"}"


