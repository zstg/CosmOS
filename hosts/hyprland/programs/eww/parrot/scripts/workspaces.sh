#!/bin/bash

workspaces() {
  ws0="0"
  ws1="1"
  ws2="2"
  ws3="3"
  ws4="4"
  ws5="5"

  #Icons
  ic0=""
  ic1=""
  ic2=""
  ic3=""
  ic4=""
  ic5=""

  #Defining classes
  class0="empty"
  class1="empty"
  class2="empty"
  class3="empty"
  class4="empty"
  class5="empty"

  #Checking if occupied
  no_oc=$(bspc query -D -d .occupied --names | wc -l)
  for (( i=1 ; i<=$no_oc ; i++));
  do 
    occu=$(bspc query -D -d .occupied --names | xargs | cut -d ' ' -f$i)
    case $occu in 
      0)
        ic0="󰊠"
        class0="occupied"
        ;;
      1)
        ic1="󰊠"
        class1="occupied"
        ;;
      2)
        ic2="󰊠"
        class2="occupied"
        ;;
      3)
        ic3="󰊠"
        class3="occupied"
        ;;
      4)
        ic4="󰊠"
        class4="occupied"
        ;;
      5)
        ic5="󰊠"
        class5="occupied"
        ;;
    esac
  done

  #Checking if focused
  f=$(bspc query -D -d focused --names | xargs)
  case $f in
    0)
      ic0="󰮯"
      class0="active"
      ;;
    1)
      ic1="󰮯"
      class1="active"
      ;;
    2)
      ic2="󰮯"
      class2="active"
      ;;
    3)
      ic3="󰮯"
      class3="active"
      ;;
    4)
      ic4="󰮯"
      class4="active"
      ;;
    5)
      ic5="󰮯"
      class5="active"
      ;;
  esac

  echo 	"(box	:class \"workspace-box\"  :halign \"left\"	:orientation \"v\" :spacing 5 :space-evenly \"false\" (eventbox :onclick \"bspc desktop -f $ws0\"	:class	\"$class0\"	\"$ic0\") (eventbox :onclick \"bspc desktop -f $ws1\"	:class \"$class1\"	 \"$ic1\") (eventbox :onclick \"bspc desktop -f $ws2\"	:class \"$class2\" \"$ic2\") (eventbox :onclick \"bspc desktop -f $ws3\"	:class \"$class3\"	\"$ic3\") (eventbox :onclick \"bspc desktop -f $ws4\"	:class \"$class4\" \"$ic4\")  (eventbox :onclick \"bspc desktop -f $ws5\"	:class \"$class5\" \"$ic5\"))"
  
}

workspaces
bspc subscribe desktop node_transfer | while read -r _ ;
do 
  workspaces
done
