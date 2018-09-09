#!/usr/bin/env fish


# vars
set monh (xdotool getdisplaygeometry | awk '{print $2}')
set dir "/usr/scripts/popup"
set background "$dir/img/bg.png"
set file "$argv[1]"
set xpos "$argv[2]"
set ypos (math $monh - 310)


# funcs
function display-background
    n30f -t popup-background \
	 -x "$xpos" \
	 -y "$ypos" \
	 -c "pkill -f 'n30f -t popup-image' && pkill -f 'n30f -t popup-background'" \
	 "$background" &
end

function display-image
    n30f -t popup-image \
	 -x (math $xpos + 40) \
	 -y (math $ypos + 35) \
	 -c "pkill -f 'n30f -t popup-image' && pkill -f 'n30f -t popup-background'" \
	 "$file" &
end


# exec
if test -z "$argv"
    printf "usage:\npopup: [file] [position]\n"
else
    display-background
    display-image
end
