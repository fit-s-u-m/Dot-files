#!/usr/bin/env sh

# Set variables
scrDir="$(dirname "$(realpath "$0")")"
source "${scrDir}/globalcontrol.sh"

# Define your custom directories
wallDir="${HOME}/Pictures/bg/"
cacheDir="${HOME}/.cache/swww"
thmbDir="${cacheDir}/thumbs"

rofiConf="${confDir}/rofi/selector.rasi"

# Set Rofi scaling
[[ "${rofiScale}" =~ ^[0-9]+$ ]] || rofiScale=10
r_scale="configuration {font: \"JetBrainsMono Nerd Font ${rofiScale}\";}"
elem_border=$(( hypr_border * 3 ))

# Scale for monitor
mon_x_res=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width') || {
    echo "Error: Unable to retrieve monitor width."
    exit 1
}
mon_scale=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .scale' | sed "s/\.//") || {
    echo "Error: Unable to retrieve monitor scale."
    exit 1
}
mon_x_res=$(( mon_x_res * 100 / mon_scale ))

# Generate config
elm_width=$(( (28 + 8 + 5) * rofiScale ))
max_avail=$(( mon_x_res - (4 * rofiScale) ))
col_count=$(( max_avail / elm_width ))
r_override="window{width:100%;} listview{columns:${col_count};spacing:5em;} element{border-radius:${elem_border}px;orientation:vertical;} element-icon{size:28em;border-radius:0em;} element-text{padding:1em;}"

# Launch Rofi menu
currentWall="$(basename "$(readlink "${cacheDir}/wall.set")")"
wallPathArray=("${wallDir}")
wallPathArray+=("${wallAddCustomPath[@]}")
get_hashmap "${wallPathArray[@]}"

rofiSel=$(parallel --link echo -en "\$(basename "{1}")"'\\x00icon\\x1f'"${thmbDir}"'/'"{2}"'.sqre\\n' ::: "${wallList[@]}" ::: "${wallHash[@]}" | rofi -dmenu -theme-str "${r_scale}" -theme-str "${r_override}" -config "${rofiConf}" -select "${currentWall}")

# Apply wallpaper
if [ ! -z "${rofiSel}" ] ; then
    setWall=""
    for i in "${!wallPathArray[@]}" ; do
        setWall="$(find "${wallPathArray[i]}" -type f -name "${rofiSel}")"
        [ -n "${setWall}" ] && break
    done
    
    if [ -n "${setWall}" ]; then
        "${scrDir}/swwwallpaper.sh" -s "${setWall}"
        notify-send -a "t1" -i "${thmbDir}/$(set_hash "${setWall}").sqre" " ${rofiSel}"
    else
        echo "Error: Wallpaper not found."
        exit 1
    fi
fi

