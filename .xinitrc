#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

xscreensaver -no-splash &
setxkbmap -model abnt2 -layout br -variant abnt2 &
start-pulseaudio-x11 &
xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &
feh --bg-scale ~/imgs/wallhaven-214692.png &

exec herbstluftwm
