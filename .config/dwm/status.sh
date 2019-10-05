#!/bin/sh

temp (){
    echo "$(sensors | awk '/Ambie/ {print $2}' | sed 's/+//')"
    #printf "%.0f°C\n" $(acpi -t | cut -d\  -f4)
}

cpuu (){
    mpstat 1 1 | grep 'Average' | awk '{printf "⚙️%02.f%%", 100 -$12}'
}

memo (){
    echo "💾$(free -h | awk '/Mem/ {print $3}')"
}

bate (){
    acpi | cut -d " " -f3-5 |  sed -e "s/,//g;s/Discharging/🔋/;s/Charging/🔌/;s/Unknown/?/;s/Full/⚡/;s/ 0*//g;s/ ://g"
}

trans (){
    up=$(transmission-remote -l | awk 'END {printf("%.02f",$4/1024)}')
    down=$(transmission-remote -l | awk 'END {printf("%.02f",$5/1024)}')
    out="T"
    if [ $up != "0.00" ]
    then
        out=$(echo "$out⯅$up")
    fi
    if [ $down != "0.00" ]
    then
        out=$(echo "$out⯆$down")
    fi
    echo $out
}

wifi (){
    iw dev wlp1s0 link | awk '/signal/{printf "📡%.0f%%",($2 + 100)*2}'
}

mocStat (){
    if [ "$(pidof mocp)" ] 
    then
        if [ "$(mocp -Q %state)" = "PAUSE" ] 
        then
            echo ⏸️ 
        elif [ "$(mocp -Q %state)" = "STOP" ] 
        then
            echo ⏹️
        else
            echo "▶️$(mocp -Q %artist-%song)"
        fi
    else
        echo "⛔"
    fi
}

redShift (){
    period=$(redshift -l manual -p | grep Period)
    if [ "$period" = "Period: Night" ]
    then
        echo 🌘
    else
        echo ☀️
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

    printf "%s%s%%\\n" "$icon" "$vol"
}

gotMail (){
    mail="$(expr $(ls $HOME/Mail/idUff/Inbox/new/ | wc -l ) + $(ls $HOME/Mail/ifmail/Inbox/new/ | wc -l ))"
    echo 📫 "$mail"
}

echo "$(mocStat)|$(wifi)|$(gotMail)|$(temp)|$(redShift)|$(cpuu)|$(memo)|$(bate)|$(volShow)|$(date '+%d %b(%a)%R')"
