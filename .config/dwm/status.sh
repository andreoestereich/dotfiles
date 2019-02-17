#!/bin/sh

temp (){
    echo 🌡️ $(sensors | awk '/Ambie/ {print $2}' | sed 's/+//')
}

cpuu (){
    mpstat 1 1 | grep 'Average' | awk '{printf "⚙️ %04.1f%%", 100 -$12}'
}

memo (){
    echo 💾$(free -h | awk '/Mem/ {print $3}')
}

bate (){
    acpi | cut -d " " -f3-5 |  sed -e "s/,//g;s/Discharging/🔋/;s/Charging/🔌/;s/Unknown/?/;s/Full/⚡/;s/ 0*/ /g;s/ :/ /g"
}

mocStat (){
    if [ "$(pidof mocp)" ] 
    then
        if [[ `mocp -Q %state` == "PAUSE" ]] 
        then
            echo ⏸️ 
        elif [[ `mocp -Q %state` == "STOP" ]] 
        then
            echo ⏹️
        else
            echo "▶️$(mocp -Q %artist-%song)"
        fi
    else
        echo "⛔"
    fi
}

volShow (){
    #- Shows volume 🔊, 🔇 if muted.
    #- Middle click to mute.

    [ "$(pulsemixer --get-mute)" = "1" ] && printf "🔇\\n" && exit

    vol=$(pulsemixer --get-volume | awk '{print $1}')

    if [ "$vol" -gt "70" ]; then
        icon="🔊"
    elif [ "$vol" -lt "30" ]; then
        icon="🔈"
    else
        icon="🔉"
    fi

    printf "%s %s%%\\n" "$icon" "$vol"
}


echo "$(mocStat)|$(temp)|$(cpuu)|$(memo)|$(bate)|$(volShow)|$(date '+%d %b (%a) %R')"
