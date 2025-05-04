charge_level=$(cat /sys/class/power_supply/BAT0/capacity)
charge_status=$(cat /sys/class/power_supply/ADP1/online)

case $1 in
  charge)
    echo $charge_level
    ;;
  status)
    echo $charge_status
    ;;
esac
