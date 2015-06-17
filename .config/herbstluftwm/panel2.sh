#!/bin/sh

FG='#aaaaaa'
BG='#000000'
#FONT='-*-terminus-*-r-normal-*-*-120-*-*-*-*-iso8859-*'
#FONT="-*-fixed-medium-*-*-*-12-*-*-*-*-*-*-*"
#FONT="xft:Terminess Powerline:size=12"
#FONT="-*-terminess-powerline-*-*-*-12-*-*-*-*-*-*-*"
#conky | dzen2 -e - -h '16' -w '1366' -ta r -fg $FG -bg $BG -fn $FONT &
conky | dzen2 -ta c  -y 768 -h 16 -w 1366  -fg $FG -bg $BG -title-name dzenbottom -e 'button2=;'
