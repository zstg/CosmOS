#!/bin/bash

hour=$(date '+%H')

icon=""

if [[ hour -gt 4 && hour -le 11 ]]
then
  wish="Good Morning"
  icon=""
elif [[ hour -gt 11 && hour -le 15 ]]
then
  wish="Good Afternoon"
  icon=""
elif [[ hour -gt 15 && hour -le 19 ]]
then
  wish="Good Evening"
  icon=""
elif [[ hour -gt 19 && hour -le 23 ]]
then
  wish="Good Night"
  icon=""
elif [[ hour -gt 23 ]]
then
  wish="Coding night it seems ...."
  icon=""
elif [[ hour -gt 0 && hour -le 4 ]]
then
  wish="Coding night it seems ..."
  icon=""
fi

case $1 in 
  icon)
    echo $icon
    ;;
  wish)
    echo $wish
    ;;
esac
