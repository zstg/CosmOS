#!/bin/bash

active_network=$(nmcli -t -f ACTIVE,SSID,SIGNAL d wifi | grep 'yes')

strength() {
  strength=$(echo $active_network | cut -d ':' -f3)
  if [[ $strength -gt 90 ]]
  then
    wifi_icon="󰤨"
  elif [[ $strength -gt 75 && $strength -lt 90 ]]
  then
    wifi_icon="󰤥"
  elif [[ $strength -gt 50 && $strength -lt 75 ]]
  then
    wifi_icon="󰤢"
  elif [[ $strength -gt 25 && $strength -lt 50 ]]
  then
    wifi_icon="󰤟"
  elif [[ $strength -lt 25 ]]
  then
    wifi_icon="󰤯"
  fi
}

if [[ $active_network ]]
then
  ssid="$(echo $active_network | cut -d ':' -f2)"
  strength
  wifi_text="Connected to $ssid"
else
  ssid=""
  wifi_icon="󰪎"
  wifi_text="Disconnected"
fi

case $1 in
  icon)
    echo $wifi_icon
    ;;
  ssid)
    echo $ssid
    ;;
  text)
    echo $wifi_text
    ;;
esac
