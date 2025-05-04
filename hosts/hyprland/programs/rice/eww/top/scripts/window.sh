window_reveal() {
  window_no=$(bspc query -N -n .local.window | wc -l)
  if [[ $window_no -gt 0 ]]
  then
    echo true
  else
    echo false
  fi
}

run_time=0

window_literal() {
  window_no=$(bspc query -N -n .local.window | wc -l)
  hidden_no=$(bspc query -N -n .hidden.local.window | wc -l)
  literal_cmd="(box :orientation \"v\" :class \"window-reveal\" :vexpand true :spacing 7"
  for (( i=1 ; i<$window_no+1 ; i++ ));
  do
    win_id=$(bspc query -N -n .local.window | xargs | cut -d ' ' -f$i)
    win_name=$(xtitle $(echo $win_id))
    color="#ffffff"
    if [[ $(echo $win_name | grep "Alacritty") ]];
    then
      icon=""
      padding="3px"
    elif [[ $(echo $win_name | grep "Firefox") ]];
    then
      icon=""
      padding="5px"
    else
      icon=""
      padding="3px"
    fi
    for (( j=1 ; j<$hidden_no+1 ; j++ ));
    do
      hidden_win_id=$(bspc query -N -n .hidden.local.window | xargs | cut -d ' ' -f$i)
      if [[ $win_id == $hidden_win_id ]];
      then
        color="#616060"
      fi
    done
    literal_cmd=$literal_cmd" (label :text \"$icon\" :style \"padding-right:$padding;color:$color\")"
  done
  literal_cmd=$literal_cmd")"
  echo $literal_cmd
}
bspc subscribe desktop node | while read -r op;
do
  case $1 in 
    reveal)
      window_reveal
      ;;
    literal)
      window_literal
      ;;
  esac
done
