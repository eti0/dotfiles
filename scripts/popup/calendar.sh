#!/usr/bin/env bash


# vars
dir="/usr/scripts/popup"
file="/tmp/calendar.png"
background="$dir/img/bg.png"
font="lime"
monitorwidth="$(xdotool getdisplaygeometry | awk '{print $1;}')"
monitorheight="$(xdotool getdisplaygeometry | awk '{print $2;}')"
x="$(expr $monitorwidth - 280)"
y="45"

hold() {
     sleep .01s
}


# exec
pkill -f "n30f -t calendar"

convert -background "rgba(0,0,0,0)" \
	-fill "#fff" \
	-font "$font" \
	-pointsize "10" \
	label:"$(date "+%d %B %Y : %R\n" && cal -m1 | tail -n7)" \
	"$file"

n30f -t calendar_background \
     -x "$x" \
     -y "$y" \
     -c "pkill -f 'n30f -t calendar'" \
     "$background" &

hold

n30f -t calendar \
     -x "$(expr $x + 88)" \
     -y "$(expr $y + 98)" \
     -c "pkill -f 'n30f -t calendar'" \
     "$file"

# n30f -t "popup-arrow" \
#      -x "$(expr $x + 180)" \
#      -y "$(expr $y - 20)" \
#      -c "pkill -f 'n30f -t calendar'" \
#      "/usr/scripts/popup/img/arrow.png"


# clean
rm "$file"
