#!/bin/env bash
DIR=$HOME/Wallpapers/Aesthetic/

# wofi window config (in %)
WIDTH=20
HEIGHT=30

PICS=($(ls ${DIR} | grep -e ".jpg$" -e ".jpeg$" -e ".png$" -e ".gif$"))

RANDOM_PIC=${PICS[ $RANDOM % ${#PICS[@]} ]}
RANDOM_PIC_NAME="${#PICS[@]}. random"


# WOFI STYLES
CONFIG="$HOME/.config/wofi/config"
STYLE="$HOME/.config/wofi/style.css"
COLORS="$HOME/.config/wofi/colors"

## Wofi Command
wofi_command="wofi --show dmenu \
			--prompt choose...
			--conf $CONFIG --style $STYLE --color $COLORS \
			--width=$WIDTH% --height=$HEIGHT% \
			--cache-file=/dev/null \
			--hide-scroll --no-actions \
			--matching=fuzzy"

menu(){
    # Here we are looping in the PICS array that is composed of all images in the $DIR
    # folder
    for i in ${!PICS[@]}; do
        # keeping the .gif to make sue you know it is animated
        if [[ -z $(echo ${PICS[$i]} | grep .gif$) ]]; then
            printf "$i. $(echo ${PICS[$i]} | cut -d. -f1)\n" # n°. <name_of_file_without_identifier>
        else
            printf "$i. ${PICS[$i]}\n"
        fi
    done

    printf "$RANDOM_PIC_NAME"
}

main() {
    choice=$(menu | ${wofi_command})

    # no choice case
    if [[ -z $choice ]]; then return; fi

    # random choice case
    if [ "$choice" = "$RANDOM_PIC_NAME" ]; then
        if hyprctl activeworkspace | grep -q "eDP-2"; then
          hyprctl hyprpaper preload ${DIR}/${RANDOM_PIC}
          hyprctl hyprpaper wallpaper "eDP-2, ${DIR}/${RANDOM_PIC}"
          return
        elif hyprctl activeworkspace | grep -q "HDMI"; then
          hyprctl hyprpaper preload ${DIR}/${RANDOM_PIC}
          hyprctl hyprpaper wallpaper "HDMI-A-1, ${DIR}/${RANDOM_PIC}"
          return
        fi
    fi

    pic_index=$(echo $choice | cut -d. -f1)
    if hyprctl activeworkspace | grep -q "eDP-2"; then
      hyprctl hyprpaper preload  ${DIR}/${PICS[$pic_index]}
      hyprctl hyprpaper wallpaper "eDP-2, ${DIR}/${PICS[$pic_index]}"
    elif hyprctl activeworkspace | grep -q "HDMI"; then
      hyprctl hyprpaper preload  ${DIR}/${PICS[$pic_index]}
      hyprctl hyprpaper wallpaper "HDMI-A-1, ${DIR}/${PICS[$pic_index]}"
    fi
}

# Check if wofi is already running
if pidof wofi >/dev/null; then
    killall wofi
    exit 0
else
    main
fi

# Uncomment to launch something if a choice was made
# if [[ -n "$choice" ]]; then
    # Restart Waybar
# fi

