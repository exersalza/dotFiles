#! /bin/bash

# This is just for my lazyness to change the title of the terminal window
# its nothing special about it, momentary its only for the xfce4 terminal
# but wenn I switch to another terminal emulator I will have to change it
# sadge

f[0]="I love rOcks"
f[1]="I love Coding"
f[2]="<3"
f[3]="Over the Rainbow..."
f[4]="I eat rocks"
f[5]="Using Arch btw..."

size=${#f[@]}
index=$((RANDOM % $size))

cp ~/.terminalrcs/terminalrcTEMP ~/.terminalrcs/terminalrc
echo "TitleInitial=${f[$index]}" >> ~/.terminalrcs/terminalrc
mv ~/.terminalrcs/terminalrc ~/.config/xfce4/terminal/terminalrc

