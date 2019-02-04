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


echo "$(i3mocp)|$(temp)|$(cpuu)|$(memo)|$(bate)|$(i3volume)|$(date '+%d %b (%a) %R')"
